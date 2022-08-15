#include "Player.h"

Player::Player(const LoaderParams* params) : SDLGameObject(params) {}

void Player::draw() { SDLGameObject::draw(); }

void Player::update() {
  velocity.setX(0);
  velocity.setY(0);
  handleInput();

  frame = int((SDL_GetTicks() / 100) % 6);
  SDLGameObject::update();
}

void Player::clean() { SDLGameObject::clean(); }

void Player::handleInput() {
  if (TheInputHandler::Instance()->isKeyDown(SDL_SCANCODE_RIGHT)) {
    velocity.setX(2);
  }
  if (TheInputHandler::Instance()->isKeyDown(SDL_SCANCODE_LEFT)) {
    velocity.setX(-2);
  }
  if (TheInputHandler::Instance()->isKeyDown(SDL_SCANCODE_UP)) {
    velocity.setY(-2);
  }
  if (TheInputHandler::Instance()->isKeyDown(SDL_SCANCODE_DOWN)) {
    velocity.setY(2);
  }

  //  if (TheInputHandler::Instance()->getMouseButtonState(mouse_buttons::LEFT))
  //  {
  //    velocity.setX(1);
  //  }
  //
  //  Vector2D* mousePosition = TheInputHandler::Instance()->getMousePosition();
  //  velocity = (*mousePosition - position) / 100;  // 100 steps from the mouse
  //
  //  if (TheInputHandler::Instance()->areJoysticksInitialized()) {
  //    // Controller 1 Left Stick
  //    int leftStickX = TheInputHandler::Instance()->xValue(0, 1);
  //    int leftStickY = TheInputHandler::Instance()->yValue(0, 1);
  //
  //    if (leftStickX > 0 || leftStickX < 0) {
  //      velocity.setX(1 * leftStickX);
  //    }
  //    if (leftStickY > 0 || leftStickY < 0) {
  //      velocity.setY(1 * leftStickY);
  //    }
  //    int rightStickX = TheInputHandler::Instance()->xValue(0, 2);
  //    int rightStickY = TheInputHandler::Instance()->yValue(0, 2);
  //
  //    if (rightStickX > 0 || rightStickX < 0) {
  //      velocity.setX(1 * rightStickX);
  //    }
  //    if (rightStickY > 0 || rightStickY < 0) {
  //      velocity.setY(1 * rightStickY);
  //    }
  //
  //    // Button Test
  //    if (TheInputHandler::Instance()->getButtonState(0, 3)) {
  //      velocity.setX(1);
  //    }
  //  }
}
