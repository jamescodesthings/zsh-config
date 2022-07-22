#include <SDL.h>
#include <SDL2/SDL_image.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <string>

#include "lib/LTexture.h"

bool init();
bool loadMedia();
void close();

SDL_Window* window = nullptr;
SDL_Renderer* renderer = nullptr;
LTexture texture;

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

bool init() {
  auto initialized = SDL_Init(SDL_INIT_VIDEO);

  if (initialized < 0) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Error Initialising SDL: %s") % SDL_GetError();
    return false;
  }

  int imgFlags = IMG_INIT_PNG;
  if (!(IMG_Init(imgFlags) & imgFlags)) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Error initializing SDL_Image: %s") % IMG_GetError();
  }

  window = SDL_CreateWindow(
      "SDL Window",
      SDL_WINDOWPOS_UNDEFINED,
      SDL_WINDOWPOS_UNDEFINED,
      SCREEN_WIDTH,
      SCREEN_HEIGHT,
      SDL_WINDOW_SHOWN
  );

  if (window == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Error creating window: %s") % SDL_GetError();
    return false;
  }

  renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
  if (renderer == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Could not create renderer: %s") % SDL_GetError();
    return false;
  }

  return true;
}

bool loadMedia() {
  return true;
}

void close() {
  texture.free();
  SDL_DestroyRenderer(renderer);
  renderer = nullptr;
  SDL_DestroyWindow(window);
  window = nullptr;
  IMG_Quit();
  SDL_Quit();
}

int main() {
  // Init
  if (!init()) {
    return 1;
  }

  // Load
  if (!loadMedia()) {
    return 1;
  }

  // Event handling
  SDL_Event event;
  bool quit = false;

  // Game Loop
  while (!quit) {
    // Input
    while (SDL_PollEvent(&event)) {
      // Quit on window close
      if (event.type == SDL_QUIT) {
        quit = true;
      }
      // Quit on escape tap
      if (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_ESCAPE) {
        quit = true;
      }

    }

    // Update

    // Draw
    SDL_SetRenderDrawColor(renderer, 0xff, 0xff, 0xff, 0xff);
    SDL_RenderClear(renderer);

    SDL_RenderPresent(renderer);
  }

  // Cleanup
  close();

  return 0;
}
