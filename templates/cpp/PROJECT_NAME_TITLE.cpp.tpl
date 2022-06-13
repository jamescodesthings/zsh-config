#include <SFML/Graphics.hpp>

using namespace sf;

#define USE_LOW_RES false
#define FULL_SCREEN false

#define WIDTH 1920
#define HEIGHT 1080

int main() {
  // Create a VideoMode
  VideoMode vm(WIDTH, HEIGHT);

#if USE_LOW_RES
  vm.width = WIDTH / 2;
  vm.height = HEIGHT / 2;
#endif

  // create and open a window for the game
#if FULL_SCREEN
  RenderWindow window(vm, "$PROJECT_NAME_PRETTY", Style::Fullscreen);
#else
  RenderWindow window(vm, "$PROJECT_NAME_PRETTY");
#endif

  // Low Res Scaling
#if USE_LOW_RES
  View view(sf::FloatRect(0, 0, WIDTH, HEIGHT));
  window.setView(view);
#endif

  // Timing
  Clock clock;

  // Game loop
  while (window.isOpen()) {
    Event event;

    while (window.pollEvent(event)) {
      if (event.type == Event::Closed) {
        window.close();
      }
    }

    if (Keyboard::isKeyPressed(Keyboard::Escape)) {
      window.close();
    }

    // Update
    Time dt = clock.restart();

    // Draw
    window.clear();
    window.display();
  }

  return 0;
}

