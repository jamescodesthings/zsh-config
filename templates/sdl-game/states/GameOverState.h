#ifndef GAMESTATES_GAMEOVERSTATE_H
#define GAMESTATES_GAMEOVERSTATE_H
#pragma once

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <vector>

#include "../lib/AnimatedGraphic.h"
#include "../lib/Game.h"
#include "../lib/GameObject.h"
#include "../lib/GameState.h"
#include "../lib/LoaderParams.h"
#include "../lib/TextureManager.h"
#include "../states/MenuState.h"
#include "../states/PlayState.h"

class GameOverState : public GameState {
 public:
  virtual void update();
  virtual void render();
  virtual bool onEnter();
  virtual bool onExit();

  virtual string getStateID() const { return stateId; };

 private:
  static void onMainClick();
  static void onRestartClick();

  static const string stateId;
  vector<GameObject*> gameObjects;
};


#endif  // GAMESTATES_GAMEOVERSTATE_H
