#include "AnimatedGraphic.h"

void AnimatedGraphic::draw() { SDLGameObject::draw(); }

void AnimatedGraphic::update() {
  frame = int(((SDL_GetTicks() / (1000 / animSpeed)) % frameCount));
}

void AnimatedGraphic::clean() { SDLGameObject::clean(); }

AnimatedGraphic::AnimatedGraphic(const LoaderParams *params, int animSpeed)
    : SDLGameObject(params) {
  this->animSpeed = animSpeed;
}
