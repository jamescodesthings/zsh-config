#ifndef GAMESTATES_MENUBUTTON_H
#define GAMESTATES_MENUBUTTON_H
#pragma once

#include "../lib/InputHandler.h"
#include "../lib/LoaderParams.h"
#include "../lib/SDLGameObject.h"

enum button_state {
  MOUSE_OUT = 0,
  MOUSE_OVER = 1,
  MOUSE_DOWN = 2,
};

class MenuButton : public SDLGameObject {
 public:
  MenuButton(const LoaderParams* params, void (*callback)());
  virtual void draw();
  virtual void update();
  virtual void clean();

  void (*callback)();

 private:
  bool released;
};


#endif  // GAMESTATES_MENUBUTTON_H
