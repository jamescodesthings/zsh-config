#include "TextureManager.h"

TextureManager *TextureManager::instance = nullptr;

void TextureManager::setRenderer(SDL_Renderer *renderer) {
  BOOST_LOG_TRIVIAL(debug) << "TextureManager renderer set";
  this->renderer = renderer;
}

bool TextureManager::load(string filename, string id) {
  if (TextureManager::renderer == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format(
               "call to TextureManager::load(%s, %s) without renderer set"
           ) % filename %
               id;
    return false;
  }

  return load(renderer, filename, id);
}

bool TextureManager::load(SDL_Renderer *renderer, string filename, string id) {
  if (id.empty()) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("You must provide an id for %s") % filename;
    return false;
  }
  SDL_Texture *newTexture = IMG_LoadTexture(renderer, filename.c_str());

  if (newTexture == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("Could not load texture %s %s: %s") % filename % id %
               IMG_GetError();
    return false;
  }

  // Add to TextureMap
  textures[id] = newTexture;

  return true;
}

void TextureManager::draw(
    string id, int x, int y, int w, int h, SDL_RendererFlip flip
) {
  if (TextureManager::renderer == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format("call to TextureManager::draw(%s) without renderer set"
           ) % id;
    return;
  }

  draw(this->renderer, id, x, y, w, h, flip);
}

void TextureManager::draw(
    SDL_Renderer *renderer,
    string id,
    int x,
    int y,
    int w,
    int h,
    SDL_RendererFlip flip
) {
  if (id.empty() || textures[id] == nullptr) {
    BOOST_LOG_TRIVIAL(warning) << boost::format("Texture %s not found") % id;
    return;
  }

  SDL_Rect srcRect;
  SDL_Rect destRect;

  srcRect.x = 0;
  srcRect.y = 0;
  srcRect.w = destRect.w = w;
  srcRect.h = destRect.h = h;
  destRect.x = x;
  destRect.y = y;

  SDL_RenderCopyEx(renderer, textures[id], &srcRect, &destRect, 0, 0, flip);
}

void TextureManager::drawFrame(
    string id,
    int x,
    int y,
    int w,
    int h,
    int currentRow,
    int currentFrame,
    SDL_RendererFlip flip
) {
  if (TextureManager::renderer == nullptr) {
    BOOST_LOG_TRIVIAL(error)
        << boost::format(
               "call to TextureManager::drawFrame(%s) without renderer set"
           ) % id;
    return;
  }

  drawFrame(renderer, id, x, y, w, h, currentRow, currentFrame, flip);
}

void TextureManager::drawFrame(
    SDL_Renderer *renderer,
    string id,
    int x,
    int y,
    int w,
    int h,
    int currentRow,
    int currentFrame,
    SDL_RendererFlip flip
) {
  if (id.empty() || textures[id] == nullptr) {
    BOOST_LOG_TRIVIAL(warning) << boost::format("Texture %s not found") % id;
    return;
  }

  SDL_Rect srcRect;
  SDL_Rect destRect;

  srcRect.x = w * currentFrame;
  srcRect.y = h * (currentRow - 1);
  srcRect.w = destRect.w = w;
  srcRect.h = destRect.h = h;
  destRect.x = x;
  destRect.y = y;

  SDL_RenderCopyEx(renderer, textures[id], &srcRect, &destRect, 0, 0, flip);
}

void TextureManager::clean() {
  BOOST_LOG_TRIVIAL(debug) << "TextureManager.clean() called";
  for (auto &texture : textures) {
    SDL_DestroyTexture(texture.second);
  }
}
