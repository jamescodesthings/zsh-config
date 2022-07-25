#ifndef ADVANCEDTIMERS_LTIMER_H
#define ADVANCEDTIMERS_LTIMER_H
#pragma once

#include <SDL.h>

#include <boost/format.hpp>
#include <boost/log/trivial.hpp>

// Application time based timer
class LTimer {
 private:
  Uint32 startTicks;
  Uint32 pausedTicks;
  bool paused;
  bool started;

 public:
  LTimer();

  void start();
  void stop();
  void pause();
  void resume();

  // Get ticks/time
  Uint32 getTicks();

  bool isStarted();
  bool isPaused();
};


#endif  // ADVANCEDTIMERS_LTIMER_H
