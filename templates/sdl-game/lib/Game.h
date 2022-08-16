#ifndef GAMECLASS_GAME_H
#define GAMECLASS_GAME_H
#pragma once

#include <SDL.h>
#include <SDL_image.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <string>
#include <vector>

#include "../states/MenuState.h"
#include "../states/PlayState.h"
#include "Enemy.h"
#include "GameObject.h"
#include "GameStateMachine.h"
#include "InputHandler.h"
#include "LoaderParams.h"
#include "Player.h"
#include "TextureManager.h"

class Game {
 private:
  static Game* instance;

  GameStateMachine* gameStateMachine;

  /**
   * Do not use, singleton.
   */
  Game() {}

  bool running = false;

  SDL_Window* window;
  SDL_Renderer* renderer;

 public:
  static Game* Instance();

  ~Game();

  /**
   * Initializes the game by creating a window, renderer and resources we need.
   * @param title The window's title
   * @param x The window's xpos
   * @param y The window's ypos
   * @param w The window's width
   * @param h The window's height
   * @param fullscreen Should the window be fullscreen?
   * @return true if successful, false otherwise
   */
  bool init(
      const std::string& title = "SDL Game",
      int x = SDL_WINDOWPOS_UNDEFINED,
      int y = SDL_WINDOWPOS_UNDEFINED,
      int w = 640,
      int h = 480,
      bool fullscreen = false
  );

  void render();
  void update();
  void handleEvents();
  void clean();

  void quit();

  bool isRunning();

  SDL_Renderer* getRenderer() const { return renderer; }

  GameStateMachine* getStateMachine() { return gameStateMachine; }
};

typedef Game TheGame;

#endif  // GAMECLASS_GAME_H
