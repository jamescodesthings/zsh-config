#include "SDLGameObject.h"
#include "Game.h"

SDLGameObject::SDLGameObject(const LoaderParams *params) : GameObject(params) {
  x = params->getX();
  y = params->getY();
  w = params->getW();
  h = params->getH();
  textureId = params->getTextureId();
  row = 1;
  frame = 1;
}

void SDLGameObject::draw() {
  TextureManager::Instance()->drawFrame(
      Game::Instance()->getRenderer(), textureId, x, y, w, h, row, frame
  );
}

void SDLGameObject::update() {}

void SDLGameObject::clean() {}
