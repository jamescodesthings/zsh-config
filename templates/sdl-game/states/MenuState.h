#ifndef MENUSTATE_H
#define MENUSTATE_H
#pragma once

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <vector>

#include "../gui/MenuButton.h"
#include "../lib/GameObject.h"
#include "../lib/GameState.h"
#include "../lib/TextureManager.h"

class MenuState : public GameState {
 public:
  virtual void update();
  virtual void render();
  virtual bool onEnter();
  virtual bool onExit();

  virtual string getStateID() const { return stateID; }

 private:
  vector<GameObject*> gameObjects;
  static const string stateID;

  static void onPlayClick();
  static void onExitClick();
};


#endif
