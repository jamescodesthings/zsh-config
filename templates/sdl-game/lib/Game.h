#ifndef GAMECLASS_GAME_H
#define GAMECLASS_GAME_H
#pragma once

#include <SDL.h>
#include <SDL_image.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <string>

#include "./TextureManager.h"

namespace ct {
class Game {
 private:
  bool running = false;

  SDL_Window* window;
  SDL_Renderer* renderer;

 public:
  Game();
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

  bool isRunning();
};
}  // namespace ct


#endif  // GAMECLASS_GAME_H
