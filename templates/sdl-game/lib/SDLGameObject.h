#ifndef ENGINEUPDATE_SDLGAMEOBJECT_H
#define ENGINEUPDATE_SDLGAMEOBJECT_H
#pragma once

#include <string>

#include "GameObject.h"
#include "LoaderParams.h"
#include "TextureManager.h"

class Game;

class SDLGameObject : public GameObject {
 protected:
  int x, y, w, h;
  int row, frame;
  string textureId;

 public:
  explicit SDLGameObject(const LoaderParams* params);

  void draw() override;
  void update() override;
  void clean() override;
};

#endif  // ENGINEUPDATE_SDLGAMEOBJECT_H
