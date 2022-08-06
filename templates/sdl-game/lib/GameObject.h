#ifndef ENGINEUPDATE_GAMEOBJECT_H
#define ENGINEUPDATE_GAMEOBJECT_H
#pragma once

#include "LoaderParams.h"

class GameObject {
 public:
  virtual void draw() = 0;
  virtual void update() = 0;
  virtual void clean() = 0;

 protected:
  explicit GameObject(const LoaderParams* params) {}

  virtual ~GameObject() = default;
};


#endif  // ENGINEUPDATE_GAMEOBJECT_H
