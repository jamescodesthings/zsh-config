#ifndef GAMESTATES_ANIMATEDGRAPHIC_H
#define GAMESTATES_ANIMATEDGRAPHIC_H
#pragma once

#include "SDLGameObject.h"

class AnimatedGraphic : public SDLGameObject {
 public:
  AnimatedGraphic(const LoaderParams* params, int animSpeed);
  virtual void draw();
  virtual void update();
  virtual void clean();

 private:
  int animSpeed;
};


#endif  // GAMESTATES_ANIMATEDGRAPHIC_H
