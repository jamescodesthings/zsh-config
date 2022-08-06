#ifndef ENGINEUPDATE_LOADERPARAMS_H
#define ENGINEUPDATE_LOADERPARAMS_H
#pragma once

#include <string>

using namespace std;

class LoaderParams {
 private:
  int x, y, w, h;
  string textureId;

 public:
  LoaderParams(int ix, int iy, int iw, int ih, string itextureId)
      : x(ix),
        y(iy),
        w(iw),
        h(ih),
        textureId(itextureId){};

  int getX() const { return this->x; }

  int getY() const { return this->y; }

  int getW() const { return this->w; }

  int getH() const { return this->h; }

  string getTextureId() const { return this->textureId; }
};


#endif  // ENGINEUPDATE_LOADERPARAMS_H
