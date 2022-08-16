#ifndef ENGINEUPDATE_LOADERPARAMS_H
#define ENGINEUPDATE_LOADERPARAMS_H
#pragma once

#include <string>

using namespace std;

class LoaderParams {
 private:
  int x, y, w, h;
  int frameCount;
  string textureId;

 public:
  LoaderParams(
      int ix, int iy, int iw, int ih, string itextureId, int frameCount = 0
  )
      : x(ix),
        y(iy),
        w(iw),
        h(ih),
        textureId(itextureId) {
    this->frameCount = frameCount;
  };

  int getX() const { return this->x; }

  int getY() const { return this->y; }

  int getW() const { return this->w; }

  int getH() const { return this->h; }

  int getFrameCount() const { return this->frameCount; }

  string getTextureId() const { return this->textureId; }
};


#endif  // ENGINEUPDATE_LOADERPARAMS_H
