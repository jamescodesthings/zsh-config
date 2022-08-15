#include "SDLGameObject.h"

#include "Game.h"

SDLGameObject::SDLGameObject(const LoaderParams *params)
    : GameObject(params),
      position((int)params->getX(), (int)params->getY()),
      velocity(0, 0),
      acceleration(0, 0) {
  w = params->getW();
  h = params->getH();
  textureId = params->getTextureId();
  row = 1;
  frame = 1;
}

void SDLGameObject::draw() {
  TextureManager::Instance()->drawFrame(
      Game::Instance()->getRenderer(),
      textureId,
      (int)position.getX(),
      (int)position.getY(),
      w,
      h,
      row,
      frame
  );
}

void SDLGameObject::update() {
  velocity += acceleration;
  position += velocity;
}

void SDLGameObject::clean() {}
