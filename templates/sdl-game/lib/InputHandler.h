#ifndef MOVEMENT_INPUTHANDLER_H
#define MOVEMENT_INPUTHANDLER_H
#pragma once

#include <SDL.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <utility>
#include <vector>

#include "Game.h"
#include "Vector2D.h"

using namespace std;

enum mouse_buttons { LEFT = 0, MIDDLE = 1, RIGHT = 2 };

class InputHandler {
 public:
  static InputHandler* Instance() {
    if (instance == nullptr) {
      instance = new InputHandler();
    }
    return instance;
  }

  void initializeJoysticks();

  bool areJoysticksInitialized() { return joysticksInitialized; }

  void update();
  void clean();
  void reset();

  int xValue(int joy, int stick);
  int yValue(int joy, int stick);

  bool getButtonState(int joy, int buttonNumber) {
    return buttonStates[joy][buttonNumber];
  }

  bool getMouseButtonState(int buttonNumber) {
    return mouseButtonStates[buttonNumber];
  }

  Vector2D* getMousePosition() { return mousePosition; }

  bool isKeyDown(SDL_Scancode key);

 private:
  static InputHandler* instance;

  // Keyboard Button State
  const Uint8* keystates = nullptr;

  // Mouse Buttons
  vector<bool> mouseButtonStates;
  // Mouse Position
  Vector2D* mousePosition;

  // Joystick
  bool joysticksInitialized;
  vector<SDL_Joystick*> joysticks;
  // Values
  // Axis
  vector<pair<Vector2D*, Vector2D*>> joystickValues;
  // Button
  vector<vector<bool>> buttonStates;
  static const int joystickDeadZone = 10000;

  InputHandler();
  ~InputHandler();
  void handleJoystickEvent(const SDL_Event& event);
  void handleMouseEvent(const SDL_Event& event);
  void handleQuitEvent(const SDL_Event& event) const;
  void handleKeyboardEvent(const SDL_Event& event);
};

typedef InputHandler TheInputHandler;


#endif  // MOVEMENT_INPUTHANDLER_H
