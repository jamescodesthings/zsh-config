#include "Game.h"

ct::Game::Game() {}

ct::Game::~Game() {
  renderer = nullptr;
  window = nullptr;
}

bool ct::Game::init(
    const std::string& title, int x, int y, int w, int h, bool fullscreen
) {
  BOOST_LOG_TRIVIAL(debug) << "Game::init()";
  Uint32 windowFlags = 0;
  Uint32 rendererFlags = SDL_RENDERER_PRESENTVSYNC | SDL_RENDERER_ACCELERATED;
  int imageFlags = IMG_INIT_PNG;

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

  // Initialize SDL_Image
  if (!(IMG_Init(imageFlags) & imageFlags)) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Could not init SDL_Image") % IMG_GetError();
    return false;
  }

  BOOST_LOG_TRIVIAL(debug) << "SDL_Image initialized";

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

  TheTextureManager::Instance()->setRenderer(renderer);
  // TheTextureManager::Instance()->load("./assets/animate-alpha.png", "animate");

  // Return true for error coding in parent
  return true;
}

void ct::Game::render() {
  BOOST_LOG_TRIVIAL(trace) << "Game::render()";
  // Set initial draw color
  SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
  SDL_RenderClear(renderer);

  // TheTextureManager::Instance()->draw("animate", 0, 0, 128, 82);


  SDL_RenderPresent(renderer);
}

void ct::Game::update() {
  BOOST_LOG_TRIVIAL(trace) << "Game::update()";

}

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
  TheTextureManager::Instance()->clean();
  IMG_Quit();
  SDL_Quit();
}

bool ct::Game::isRunning() { return running; }
