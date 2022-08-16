#ifndef GAMESTATES_PAUSESTATE_H
#define GAMESTATES_PAUSESTATE_H
#pragma once

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <vector>

#include "../lib/Game.h"
#include "../lib/GameObject.h"
#include "../lib/GameState.h"
#include "../lib/LoaderParams.h"
#include "../lib/TextureManager.h"

class PauseState : public GameState {
 public:
  virtual void update();
  virtual void render();
  virtual bool onEnter();
  virtual bool onExit();

  virtual string getStateID() const { return stateID; }

 private:
  static const string stateID;
  static void onMainMenuClick();
  static void onResumeClick();

  vector<GameObject*> gameObjects;
};


#endif  // GAMESTATES_PAUSESTATE_H
