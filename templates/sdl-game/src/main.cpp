#include "../lib/Game.h"

int main(int argc, char* args[]) {
  auto* game = new ct::Game();

  if (!game->init()) return -1;

  while (game->isRunning()) {
    game->handleEvents();
    game->update();
    game->render();
  }

  game->clean();

  return 0;
}
