#ifndef VECTOR2D_H
#define VECTOR2D_H
#pragma once

#include <math.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>

class Vector2D {
 private:
  float x, y;

 public:
  Vector2D(float x, float y) {
    this->x = x;
    this->y = y;
  }

  float getX() { return x; };

  float getY() { return y; };

  void setX(float x) { this->x = x; };

  void setY(float y) { this->y = y; };

  float length() { return sqrt(x * x + y * y); }

  void normalize() {
    float l = length();
    if (l <= 0) {  // no divide 0
      BOOST_LOG_TRIVIAL(warning) << "Could not normalize vector, divide 0";
      return;
    }

    // normalze by making length = 1, scale becomes 1/l
    (*this) *= 1 / l;
  }

  Vector2D operator+(const Vector2D& v2) const {
    return Vector2D(x + v2.x, y + v2.y);
  }

  friend Vector2D& operator+=(Vector2D& v1, const Vector2D& v2) {
    v1.x += v2.x;
    v1.y += v2.y;
    return v1;
  }

  Vector2D operator-(const Vector2D& v2) const {
    return Vector2D(x - v2.x, y - v2.y);
  }

  friend Vector2D& operator-=(Vector2D& v1, const Vector2D& v2) {
    v1.x -= v2.x;
    v1.y -= v2.y;
    return v1;
  }

  Vector2D operator*(float scalar) const {
    return Vector2D(x * scalar, y * scalar);
  }

  Vector2D& operator*=(float scalar) {
    x *= scalar;
    y *= scalar;
    return *this;
  }

  Vector2D operator/(float scalar) const {
    return Vector2D(x / scalar, y / scalar);
  }

  Vector2D& operator/=(float scalar) {
    x /= scalar;
    y /= scalar;
    return *this;
  }
};

#endif
