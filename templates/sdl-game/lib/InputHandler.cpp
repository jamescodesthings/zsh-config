#include "InputHandler.h"

InputHandler* InputHandler::instance = nullptr;

void InputHandler::initializeJoysticks() {
  if (SDL_WasInit(SDL_INIT_JOYSTICK) == 0) {
    BOOST_LOG_TRIVIAL(debug) << "Initializing Joysticks";
    SDL_InitSubSystem(SDL_INIT_JOYSTICK);
  }

  if (SDL_NumJoysticks() <= 0) {
    BOOST_LOG_TRIVIAL(debug) << "No joysticks found";
    joysticksInitialized = false;
    return;
  }

  for (int i = 0; i < SDL_NumJoysticks(); i++) {
    SDL_Joystick* joystick = SDL_JoystickOpen(i);
    if (joystick != nullptr) {
      joysticks.emplace_back(joystick);
      // Add a pair for joystick axis values
      joystickValues.emplace_back(
          make_pair(new Vector2D(0, 0), new Vector2D(0, 0))
      );

      vector<bool> joyButtons;
      for (int buttonI = 0; buttonI < SDL_JoystickNumButtons(joystick);
           buttonI++) {
        // Init all buttons as false
        joyButtons.emplace_back(false);
      }
      buttonStates.emplace_back(joyButtons);
    } else {
      BOOST_LOG_TRIVIAL(error
      ) << boost::format("Could not open Joystick %d: %s") % i % SDL_GetError();
    }
  }

  SDL_JoystickEventState(SDL_ENABLE);
  joysticksInitialized = true;
  BOOST_LOG_TRIVIAL(debug) << boost::format("Initialized %d joystick(s)") %
                                  joysticks.size();
}

void InputHandler::update() {
  SDL_Event event;
  while (SDL_PollEvent(&event)) {
    handleQuitEvent(event);

    handleMouseEvent(event);

    handleJoystickEvent(event);

    handleKeyboardEvent(event);
  }
}

void InputHandler::handleKeyboardEvent(const SDL_Event& event) {
  if (event.type == SDL_KEYDOWN || event.type == SDL_KEYUP) {
    keystates = SDL_GetKeyboardState(nullptr);
  }
}

void InputHandler::handleQuitEvent(const SDL_Event& event
) const {  // Quit on SDL_Quit
  if (event.type == SDL_QUIT) {
    TheGame::Instance()->quit();
  }

  // Quit on Escape
  if (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_ESCAPE) {
    TheGame::Instance()->quit();
  }
}

void InputHandler::handleMouseEvent(const SDL_Event& event) {
  if (event.type == SDL_MOUSEBUTTONDOWN) {
    if (event.button.button == SDL_BUTTON_LEFT) {
      mouseButtonStates[LEFT] = true;
    }
    if (event.button.button == SDL_BUTTON_MIDDLE) {
      mouseButtonStates[MIDDLE] = true;
    }
    if (event.button.button == SDL_BUTTON_RIGHT) {
      mouseButtonStates[RIGHT] = true;
    }
  }

  if (event.type == SDL_MOUSEBUTTONUP) {
    if (event.button.button == SDL_BUTTON_LEFT) {
      mouseButtonStates[LEFT] = false;
    }
    if (event.button.button == SDL_BUTTON_MIDDLE) {
      mouseButtonStates[MIDDLE] = false;
    }
    if (event.button.button == SDL_BUTTON_RIGHT) {
      mouseButtonStates[RIGHT] = false;
    }
  }

  if (event.type == SDL_MOUSEMOTION) {
    mousePosition->setX(event.motion.x);
    mousePosition->setY(event.motion.y);
  }
}

void InputHandler::handleJoystickEvent(const SDL_Event& event
) {  // Joystick Axis Movement
  if (event.type == SDL_JOYAXISMOTION) {
    int which = event.jaxis.which;

    // Left stick L/R
    if (event.jaxis.axis == 0) {
      if (event.jaxis.value > joystickDeadZone) {
        // Right
        joystickValues[which].first->setX(1.f);
      } else if (event.jaxis.value < -joystickDeadZone) {
        // Left
        joystickValues[which].first->setX(-1.f);
      } else {
        // Reset
        joystickValues[which].first->setX(0.f);
      }
    }

    // Left stick U/D
    if (event.jaxis.axis == 1) {
      if (event.jaxis.value > joystickDeadZone) {
        // Right
        joystickValues[which].first->setY(1.f);
      } else if (event.jaxis.value < -joystickDeadZone) {
        // Left
        joystickValues[which].first->setY(-1.f);
      } else {
        // Reset
        joystickValues[which].first->setY(0.f);
      }
    }

    // Right stick L/R
    if (event.jaxis.axis == 2) {
      if (event.jaxis.value > joystickDeadZone) {
        // Right
        joystickValues[which].second->setX(1.f);
      } else if (event.jaxis.value < -joystickDeadZone) {
        // Left
        joystickValues[which].second->setX(-1.f);
      } else {
        // Reset
        joystickValues[which].second->setX(0.f);
      }
    }

    // Right stick U/D
    if (event.jaxis.axis == 3) {
      if (event.jaxis.value > joystickDeadZone) {
        // Right
        joystickValues[which].second->setY(1.f);
      } else if (event.jaxis.value < -joystickDeadZone) {
        // Left
        joystickValues[which].second->setY(-1.f);
      } else {
        // Reset
        joystickValues[which].second->setY(0.f);
      }
    }
  }

  if (event.type == SDL_JOYBUTTONDOWN) {
    int which = event.jaxis.which;
    buttonStates[which][event.jbutton.button] = true;
  }
  if (event.type == SDL_JOYBUTTONUP) {
    int which = event.jaxis.which;
    buttonStates[which][event.jbutton.button] = false;
  }
}

void InputHandler::clean() {
  BOOST_LOG_TRIVIAL(debug) << "InputHandler::clean()";
  if (joysticksInitialized) {
    for (auto& joystick : joysticks) {
      SDL_JoystickClose(joystick);
    }
  }
}

InputHandler::InputHandler()
    : keystates(nullptr),
      mousePosition(new Vector2D(0, 0)),
      joysticksInitialized(false) {
  for (int i = 0; i < 3; i++) {
    mouseButtonStates.emplace_back(false);
  }
}

InputHandler::~InputHandler() {}

int InputHandler::xValue(int joy, int stick) {
  if (joystickValues.empty()) return 0;

  if (stick == 1) {
    return (int)joystickValues[joy].first->getX();
  }

  return (int)joystickValues[joy].second->getX();
}

int InputHandler::yValue(int joy, int stick) {
  if (joystickValues.empty()) return 0;

  if (stick == 1) {
    return (int)joystickValues[joy].first->getY();
  }

  return (int)joystickValues[joy].second->getY();
}

bool InputHandler::isKeyDown(SDL_Scancode key) {
  if (keystates == nullptr) return false;

  if (keystates[key] == 1) return true;

  return false;
}
