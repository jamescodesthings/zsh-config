#include "PlayState.h"

const string PlayState::stateID = "PLAY";

void PlayState::update() {
  if (TheInputHandler::Instance()->isKeyDown(SDL_SCANCODE_ESCAPE)) {
    TheGame::Instance()->getStateMachine()->pushState(new PauseState());
  }

  for (auto& go : gameObjects) {
    go->update();
  }

  SDLGameObject* player = dynamic_cast<SDLGameObject*>(gameObjects[0]);
  SDLGameObject* enemy = dynamic_cast<SDLGameObject*>(gameObjects[1]);

  if (checkCollision(player, enemy)) {
    BOOST_LOG_TRIVIAL(debug) << "Game Over, collision detected";
    TheGame::Instance()->getStateMachine()->changeState(new GameOverState());
  }
}

void PlayState::render() {
  for (auto& go : gameObjects) {
    go->draw();
  }
}

bool PlayState::onEnter() {
  BOOST_LOG_TRIVIAL(debug) << boost::format("Enter %s") % PlayState::stateID;
  if (!TheTextureManager::Instance()->load(
          "assets/helicopter.png", "helicopter"
      ))
    return false;
  if (!TheTextureManager::Instance()->load(
          "assets/helicopter2.png", "helicopter2"
      ))
    return false;

  GameObject* player =
      new Player(new LoaderParams(500, 100, 128, 55, "helicopter"));
  GameObject* enemy =
      new Enemy(new LoaderParams(100, 100, 128, 55, "helicopter2"));
  gameObjects.emplace_back(player);
  gameObjects.emplace_back(enemy);

  return true;
}

bool PlayState::onExit() {
  BOOST_LOG_TRIVIAL(debug) << boost::format("Exit %s") % PlayState::stateID;
  for (auto& go : gameObjects) {
    go->clean();
  }

  TheTextureManager::Instance()->clearTexture("helicopter");
  TheTextureManager::Instance()->clearTexture("helicopter2");

  return true;
}

bool PlayState::checkCollision(SDLGameObject* p1, SDLGameObject* p2) {
  SDL_Rect p1Rect;
  SDL_Rect p2Rect;
  p1Rect.x = p1->getPosition().getX();
  p1Rect.y = p1->getPosition().getY();
  p1Rect.w = p1->getWidth();
  p1Rect.h = p1->getHeight();
  p2Rect.x = p2->getPosition().getX();
  p2Rect.y = p2->getPosition().getY();
  p2Rect.w = p2->getWidth();
  p2Rect.h = p2->getHeight();

  return SDL_HasIntersection(&p1Rect, &p2Rect);
}
