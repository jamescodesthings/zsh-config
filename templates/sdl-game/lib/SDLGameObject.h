#ifndef ENGINEUPDATE_SDLGAMEOBJECT_H
#define ENGINEUPDATE_SDLGAMEOBJECT_H
#pragma once

#include <string>

#include "GameObject.h"
#include "LoaderParams.h"
#include "TextureManager.h"
#include "Vector2D.h"


class Game;

class SDLGameObject : public GameObject {
 protected:
  Vector2D position;
  Vector2D velocity;
  Vector2D acceleration;

  int w, h;
  int row, frame, frameCount;
  string textureId;

 public:
  explicit SDLGameObject(const LoaderParams* params);

  void draw() override;
  void update() override;
  void clean() override;

  Vector2D getPosition() { return position; }

  int getWidth() { return w; }

  int getHeight() { return h; }
};

#endif  // ENGINEUPDATE_SDLGAMEOBJECT_H
