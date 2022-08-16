#include "GameOverState.h"

const string GameOverState::stateId = "GAMEOVER";

void GameOverState::update() {
  for (auto& go : gameObjects) {
    go->update();
  }
}

void GameOverState::render() {
  for (auto& go : gameObjects) {
    go->draw();
  }
}

bool GameOverState::onEnter() {
  if (!TheTextureManager::Instance()->load(
          "assets/gameover.png", "gameOverText"
      ))
    return false;
  if (!TheTextureManager::Instance()->load("assets/main.png", "mainButton"))
    return false;
  if (!TheTextureManager::Instance()->load(
          "assets/restart.png", "restartButton"
      ))
    return false;

  GameObject* gameOver = new AnimatedGraphic(
      new LoaderParams(200, 100, 190, 30, "gameOverText", 2), 2
  );

  GameObject* mainButton = new MenuButton(
      new LoaderParams(200, 200, 200, 80, "mainButton"), onMainClick
  );
  GameObject* restartButton = new MenuButton(
      new LoaderParams(200, 300, 200, 80, "restartButton"), onRestartClick
  );

  gameObjects.emplace_back(gameOver);
  gameObjects.emplace_back(mainButton);
  gameObjects.emplace_back(restartButton);

  return true;
}

bool GameOverState::onExit() {
  TheTextureManager::Instance()->clearTexture("gameOverText");
  TheTextureManager::Instance()->clearTexture("mainButton");
  TheTextureManager::Instance()->clearTexture("restartButton");

  for (auto& go : gameObjects) {
    go->clean();
  }

  return true;
}

void GameOverState::onMainClick() {
  TheGame::Instance()->getStateMachine()->changeState(new MenuState());
}

void GameOverState::onRestartClick() {
  TheGame::Instance()->getStateMachine()->changeState(new PlayState());
}
