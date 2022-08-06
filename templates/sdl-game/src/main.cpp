#include <boost/log/core.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/trivial.hpp>

#include "../lib/Game.h"

void setLogLevel();

int main(int argc, char* args[]) {
  setLogLevel();

  BOOST_LOG_TRIVIAL(debug) << "Initializing";

  if (!TheGame::Instance()->init()) {
    BOOST_LOG_TRIVIAL(error) << "Game Init failure";
    return -1;
  }

  while (TheGame::Instance()->isRunning()) {
    TheGame::Instance()->handleEvents();
    TheGame::Instance()->update();
    TheGame::Instance()->render();
  }

  TheGame::Instance()->clean();

  return 0;
}

void setLogLevel() {
  boost::log::core::get()->set_filter(
      boost::log::trivial::severity >= boost::log::trivial::debug
  );
}
