#ifndef ENGINEUPDATE_ENEMY_H
#define ENGINEUPDATE_ENEMY_H
#pragma once

#include "SDLGameObject.h"

class Enemy : public SDLGameObject {
 public:
  explicit Enemy(const LoaderParams* params);
  void draw() override;
  void update() override;
  void clean() override;
};


#endif  // ENGINEUPDATE_ENEMY_H
