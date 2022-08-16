#include "Game.h"

Game* Game::instance = nullptr;

Game::~Game() {
  renderer = nullptr;
  window = nullptr;
}

bool Game::init(
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

  TheInputHandler::Instance()->initializeJoysticks();

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

  gameStateMachine = new GameStateMachine();
  gameStateMachine->pushState(new MenuState());

  // Set running to start game loop
  running = true;
  BOOST_LOG_TRIVIAL(debug) << "Set running true, initialization finished.";

  // Return true for error coding in parent
  return true;
}

void Game::render() {
  BOOST_LOG_TRIVIAL(trace) << "Game::render()";
  // Set initial draw color
  SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
  SDL_RenderClear(renderer);

  // TheTextureManager::Instance()->draw("animate", 0, 0, 128, 82);
  // for (auto& gameObject : gameObjects) {
  //   gameObject->draw();
  // }
  gameStateMachine->render();

  SDL_RenderPresent(renderer);
}

void Game::update() {
  BOOST_LOG_TRIVIAL(trace) << "Game::update()";
  // for (auto& gameObject : gameObjects) {
  //   gameObject->update();
  // }

  gameStateMachine->update();
}

void Game::handleEvents() { TheInputHandler::Instance()->update(); }

void Game::clean() {
  BOOST_LOG_TRIVIAL(debug) << "Game::clean()";
  TheInputHandler::Instance()->clean();
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  TheTextureManager::Instance()->clean();
  IMG_Quit();
  SDL_Quit();
}

bool Game::isRunning() { return running; }

Game* Game::Instance() {
  if (Game::instance == nullptr) {
    Game::instance = new Game();
  }

  return Game::instance;
}

void Game::quit() {
  BOOST_LOG_TRIVIAL(debug) << "Game::quit()";
  this->running = false;
}
