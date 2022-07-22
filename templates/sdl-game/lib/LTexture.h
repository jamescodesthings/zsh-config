#ifndef COLORKEYING_LTEXTURE_H
#define COLORKEYING_LTEXTURE_H
#pragma once

#include <SDL.h>
#include <SDL2/SDL_image.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <string>

// Texture wrapper class
class LTexture {
 private:
  SDL_Texture* texture;

  int width;
  int height;

 public:
  // ctor
  LTexture();

  // destructor
  ~LTexture();

  // as it sounds
  bool loadFromFile(SDL_Renderer* renderer, std::string path);

  // deallocate texture
  void free();

  // Renders at a given point
  void render(
      SDL_Renderer* renderer, int x = 0, int y = 0, SDL_Rect* clip = nullptr
  );

  // Set color
  void setColor(Uint8 r, Uint8 g, Uint8 b);

  // gets dims
  int getWidth();
  int getHeight();
};


#endif  // COLORKEYING_LTEXTURE_H
