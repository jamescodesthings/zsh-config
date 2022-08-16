#include "MenuState.h"

const string MenuState::stateID = "MENU";

void MenuState::update() {
  for (auto& go : gameObjects) {
    go->update();
  }
}

void MenuState::render() {
  for (auto& go : gameObjects) {
    go->draw();
  }
}

bool MenuState::onEnter() {
  BOOST_LOG_TRIVIAL(debug) << boost::format("Enter %s") % MenuState::stateID;
  if (!TheTextureManager::Instance()->load("assets/button.png", "playButton"))
    return false;
  if (!TheTextureManager::Instance()->load("assets/exit.png", "exitButton"))
    return false;

  GameObject* playButton = new MenuButton(
      new LoaderParams(100, 100, 400, 100, "playButton"), onPlayClick
  );
  GameObject* exitButton = new MenuButton(
      new LoaderParams(100, 300, 400, 100, "exitButton"), onExitClick
  );

  gameObjects.emplace_back(playButton);
  gameObjects.emplace_back(exitButton);

  return true;
}

bool MenuState::onExit() {
  BOOST_LOG_TRIVIAL(debug) << boost::format("Exit %s") % MenuState::stateID;
  for (auto& go : gameObjects) {
    go->clean();
  }

  TheTextureManager::Instance()->clearTexture("playButton");
  TheTextureManager::Instance()->clearTexture("exitButton");

  return true;
}

void MenuState::onPlayClick() {
  BOOST_LOG_TRIVIAL(debug) << "Play button clicked";
  TheGame::Instance()->getStateMachine()->changeState(new PlayState());
}

void MenuState::onExitClick() {
  BOOST_LOG_TRIVIAL(debug) << "Exit button clicked";
  TheGame::Instance()->quit();
}
