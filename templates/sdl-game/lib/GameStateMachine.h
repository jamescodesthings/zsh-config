#ifndef GAMESTATEMACHINE_H
#define GAMESTATEMACHINE_H
#pragma once

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <vector>
#include "GameState.h"

using namespace std;


class GameStateMachine {
  private:
    vector<GameState*> states;
  public:
    void pushState(GameState* state);
    void changeState(GameState* state);
    void popState();

    void update();
    void render();
};


#endif
