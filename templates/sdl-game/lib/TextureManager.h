#ifndef TEXTURES_TEXTUREMANAGER_H
#define TEXTURES_TEXTUREMANAGER_H
#pragma once

#include <SDL.h>
#include <SDL_image.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>
#include <map>
#include <string>

class Game;

using namespace std;

class TextureManager {
 private:
  static TextureManager* instance;

  SDL_Renderer* renderer = nullptr;

  map<string, SDL_Texture*> textures;

  // Private for singleton access
  TextureManager() {}

 public:
  static TextureManager* Instance();

  /**
   * Loads a texture (Must call setRenderer before using this method)
   * @param filename The filename
   * @param id The ID to give it
   * @return True if successful, false otherwise
   */
  bool load(string filename, string id);

  /**
   * Loads a texture
   * @param renderer The renderer to load for
   * @param filename The filename
   * @param id The ID to give it
   * @return True if successful, false otherwise
   */
  bool load(SDL_Renderer* renderer, string filename, string id);

  /**
   * Draws a texture (Must call setRenderer before using this method)
   * @param id The texture id
   * @param x The x position to draw at
   * @param y The y position to draw at
   * @param w The width of the texture
   * @param h The height of the texture
   * @param flip The flip option
   */
  void draw(
      string id,
      int x,
      int y,
      int w,
      int h,
      SDL_RendererFlip flip = SDL_FLIP_NONE
  );
  /**
   * Draws a texture
   * @param renderer The renderer to draw on
   * @param id The texture id
   * @param x The x position to draw at
   * @param y The y position to draw at
   * @param w The width of the texture
   * @param h The height of the texture
   * @param flip The flip option
   */
  void draw(
      SDL_Renderer* renderer,
      string id,
      int x,
      int y,
      int w,
      int h,
      SDL_RendererFlip flip = SDL_FLIP_NONE
  );

  /**
   * Draws a frame of a texture (Must call setRenderer before using this
   * method)
   * @param id The texture id
   * @param x The x position to draw at
   * @param y The y position to draw at
   * @param w The width of the texture
   * @param h The height of the texture
   * @param currentRow The row to draw
   * @param currentFrame The frame to draw
   * @param flip The flip option
   */
  void drawFrame(
      string id,
      int x,
      int y,
      int w,
      int h,
      int currentRow,
      int currentFrame,
      SDL_RendererFlip = SDL_FLIP_NONE
  );
  /**
   * Draws a frame of a texture
   * @param renderer The renderer to draw on
   * @param id The texture id
   * @param x The x position to draw at
   * @param y The y position to draw at
   * @param w The width of the texture
   * @param h The height of the texture
   * @param currentRow
   * @param currentFrame
   * @param flip The flip option
   */
  void drawFrame(
      SDL_Renderer* renderer,
      string id,
      int x,
      int y,
      int w,
      int h,
      int currentRow,
      int currentFrame,
      SDL_RendererFlip = SDL_FLIP_NONE
  );

  //  SDL_QueryTexture(newTexture, nullptr, nullptr, &width, &height);
  void clean();

  void clearTexture(string id);
};

typedef TextureManager TheTextureManager;

#endif  // TEXTURES_TEXTUREMANAGER_H
