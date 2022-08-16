#include "PauseState.h"

const string PauseState::stateID = "PAUSE";

void PauseState::update() {
  for (auto& go : gameObjects) {
    go->update();
  }
}

void PauseState::render() {
  for (auto& go : gameObjects) {
    go->draw();
  }
}

bool PauseState::onEnter() {
  if (!TheTextureManager::Instance()->load("assets/main.png", "mainButton"))
    return false;
  if (!TheTextureManager::Instance()->load("assets/resume.png", "resumeButton"))
    return false;

  GameObject* menuButton = new MenuButton(
      new LoaderParams(200, 100, 200, 80, "mainButton"), onMainMenuClick
  );
  GameObject* resumeButton = new MenuButton(
      new LoaderParams(200, 300, 200, 80, "resumeButton"), onResumeClick
  );
  gameObjects.emplace_back(menuButton);
  gameObjects.emplace_back(resumeButton);

  return true;
}

bool PauseState::onExit() {
  for (auto& go : gameObjects) {
    go->clean();
  }
  gameObjects.clear();

  TheTextureManager::Instance()->clearTexture("resumeButton");
  TheTextureManager::Instance()->clearTexture("mainButton");
  TheInputHandler::Instance()->reset();
  return true;
}

void PauseState::onMainMenuClick() {
  BOOST_LOG_TRIVIAL(debug) << "Main Menu clicked";
  TheGame::Instance()->getStateMachine()->changeState(new MenuState());
}

void PauseState::onResumeClick() {
  TheGame::Instance()->getStateMachine()->popState();
}
