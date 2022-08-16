#include "Enemy.h"

Enemy::Enemy(const LoaderParams *params) : SDLGameObject(params) {
  velocity.setY(2);
  velocity.setX(0.0001);
}

void Enemy::draw() { SDLGameObject::draw(); }

void Enemy::update() {
  frame = int((SDL_GetTicks() / 100) % 5);

  // Up/down movement
  if (position.getY() < 0) {
    velocity.setY(2);
  } else if (position.getY() > 400) {
    velocity.setY(-2);
  }

  SDLGameObject::update();
}

void Enemy::clean() { SDLGameObject::clean(); }
