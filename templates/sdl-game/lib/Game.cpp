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
  TheTextureManager::Instance()->load("./assets/animate-alpha.png", "animate");


  // gameObjects.emplace_back(
  //     new Player(new LoaderParams(100, 100, 128, 82, "animate"))
  // );
  // gameObjects.emplace_back(
  //     new Enemy(new LoaderParams(300, 300, 128, 82, "animate"))
  // );

  // Return true for error coding in parent
  return true;
}

void Game::render() {
  BOOST_LOG_TRIVIAL(trace) << "Game::render()";
  // Set initial draw color
  SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
  SDL_RenderClear(renderer);

  // TheTextureManager::Instance()->draw("animate", 0, 0, 128, 82);
  for (auto& gameObject : gameObjects) {
    gameObject->draw();
  }

  SDL_RenderPresent(renderer);
}

void Game::update() {
  BOOST_LOG_TRIVIAL(trace) << "Game::update()";
  for (auto& gameObject : gameObjects) {
    gameObject->update();
  }
}

void Game::handleEvents() {
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

void Game::clean() {
  BOOST_LOG_TRIVIAL(debug) << "Game::clean()";
  for (auto& gameObject : gameObjects) {
    gameObject->clean();
  }
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
