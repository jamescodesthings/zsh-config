#ifndef PLAYSTATE_H
#define PLAYSTATE_H
#pragma once

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <vector>

#include "../lib/Enemy.h"
#include "../lib/GameObject.h"
#include "../lib/GameState.h"
#include "../lib/LoaderParams.h"
#include "../lib/Player.h"
#include "../lib/TextureManager.h"
#include "../states/GameOverState.h"
#include "../states/PauseState.h"

class PlayState : public GameState {
 public:
  virtual void update();
  virtual void render();
  virtual bool onEnter();
  virtual bool onExit();

  virtual string getStateID() const { return stateID; }

 private:
  bool checkCollision(SDLGameObject* p1, SDLGameObject* p2);

  static const string stateID;
  vector<GameObject*> gameObjects;
};


#endif
