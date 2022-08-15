#ifndef ENGINEUPDATE_PLAYER_H
#define ENGINEUPDATE_PLAYER_H
#pragma once

#include "InputHandler.h"
#include "SDLGameObject.h"

class Player : public SDLGameObject {
 public:
  explicit Player(const LoaderParams* params);

  void draw() override;
  void update() override;
  void clean() override;

 private:
  void handleInput();
};


#endif  // ENGINEUPDATE_PLAYER_H
