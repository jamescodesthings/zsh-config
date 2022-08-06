#include <boost/log/core.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/trivial.hpp>

#include "../lib/Game.h"

void setLogLevel();

int main(int argc, char* args[]) {
  auto* game = new ct::Game();

  setLogLevel();

  if (!game->init()) return -1;

  while (game->isRunning()) {
    game->handleEvents();
    game->update();
    game->render();
  }

  game->clean();


  return 0;
}

void setLogLevel() {
  boost::log::core::get()->set_filter(
      boost::log::trivial::severity >= boost::log::trivial::debug
  );
}
