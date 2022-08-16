#include "MenuButton.h"

MenuButton::MenuButton(const LoaderParams* params, void (*callback)())
    : SDLGameObject(params) {
  // Initial state = out
  frame = MOUSE_OUT;
  this->callback = callback;
}

void MenuButton::draw() { SDLGameObject::draw(); }

void MenuButton::update() {
  Vector2D* mousePos = TheInputHandler::Instance()->getMousePosition();

  SDL_Point mouse;
  mouse.x = (int)mousePos->getX();
  mouse.y = (int)mousePos->getY();
  SDL_Rect bounds;
  bounds.x = (int)position.getX();
  bounds.y = (int)position.getY();
  bounds.w = w;
  bounds.h = h;

  if (SDL_PointInRect(&mouse, &bounds)) {
    // Collision
    //    frame = MOUSE_OVER;

    bool leftDown = TheInputHandler::Instance()->getMouseButtonState(LEFT);
    if (leftDown && released) {
      frame = MOUSE_DOWN;
      callback();
      released = false;
    } else if (!leftDown) {
      released = true;
      frame = MOUSE_OVER;
    }

  } else {
    frame = MOUSE_OUT;
  }

  SDLGameObject::update();
}

void MenuButton::clean() { SDLGameObject::clean(); }
