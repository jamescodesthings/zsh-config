#include "LTexture.h"

LTexture::LTexture() {
  texture = nullptr;
  width = 0;
  height = 0;
}

LTexture::~LTexture() { free(); }

bool LTexture::loadFromFile(SDL_Renderer* renderer, std::string path) {
  // Clear out old texture(s)
  free();

  SDL_Texture* newTexture = IMG_LoadTexture(renderer, path.c_str());
  if (newTexture == nullptr) {
    BOOST_LOG_TRIVIAL(error) << boost::format("Could not load texture %s: %s") %
                                    path % IMG_GetError();
    return false;
  }

  SDL_QueryTexture(newTexture, nullptr, nullptr, &width, &height);

  this->texture = newTexture;
  return true;
}

void LTexture::free() {
  if (texture != nullptr) {
    SDL_DestroyTexture(texture);
    texture = nullptr;
    width = 0;
    height = 0;
  }
}

void LTexture::render(SDL_Renderer* renderer, int x, int y, SDL_Rect* clip) {
  SDL_Rect renderQuad = {x, y, width, height};

  if (clip != nullptr) {
    renderQuad.w = clip->w;
    renderQuad.h = clip->h;
  }

  SDL_RenderCopy(renderer, texture, clip, &renderQuad);
}

int LTexture::getWidth() { return width; }

int LTexture::getHeight() { return height; }

void LTexture::setColor(Uint8 r, Uint8 g, Uint8 b) {
  SDL_SetTextureColorMod(texture, r, g, b);
}
