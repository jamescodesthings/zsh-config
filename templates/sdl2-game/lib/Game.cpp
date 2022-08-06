#include "Game.h"

ct::Game::Game() {}

ct::Game::~Game() {}

bool ct::Game::init(
    const std::string& title, int x, int y, int w, int h, bool fullscreen
) {
  BOOST_LOG_TRIVIAL(debug) << "Game::init()";
  Uint32 windowFlags = 0;
  Uint32 rendererFlags = SDL_RENDERER_PRESENTVSYNC | SDL_RENDERER_ACCELERATED;

  if (fullscreen) {
    BOOST_LOG_TRIVIAL(debug) << "Will create fullscreen screen";
    windowFlags |= SDL_WINDOW_FULLSCREEN;
  }

  // Initialize SDL
  if (SDL_Init(SDL_INIT_EVERYTHING) != 0) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Could not init SDL") % SDL_GetError();
    return false;
  }
  BOOST_LOG_TRIVIAL(debug) << "SDL Initialized";

  window = SDL_CreateWindow(title.c_str(), x, y, w, h, windowFlags);

  if (window == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Could not create window") % SDL_GetError();
    return false;
  }
  BOOST_LOG_TRIVIAL(debug) << "Created window";

  renderer = SDL_CreateRenderer(window, -1, rendererFlags);
  if (renderer == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Could not create renderer") % SDL_GetError();
    return false;
  }

  BOOST_LOG_TRIVIAL(debug) << "Created Renderer";
  // Set running to start game loop
  running = true;
  BOOST_LOG_TRIVIAL(debug) << "Set running true, initialization finished.";

  // Return true for error coding in parent
  return true;
}

void ct::Game::render() {
  BOOST_LOG_TRIVIAL(trace) << "Game::render()";
  // Set initial draw color
  SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
  SDL_RenderClear(renderer);

  SDL_RenderPresent(renderer);
}

void ct::Game::update() { BOOST_LOG_TRIVIAL(trace) << "Game::update()"; }

void ct::Game::handleEvents() {
  SDL_Event event;

  while (SDL_PollEvent(&event)) {
    if (event.type == SDL_QUIT) {
      running = false;
    }
    if (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_ESCAPE) {
      running = false;
    }
  }
}

void ct::Game::clean() {
  BOOST_LOG_TRIVIAL(debug) << "Game::clean()";
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
}

bool ct::Game::isRunning() { return running; }
