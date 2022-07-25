#include "LTimer.h"

LTimer::LTimer() {
  startTicks = 0;
  pausedTicks = 0;

  paused = false;
  started = false;
}

void LTimer::start() {
  BOOST_LOG_TRIVIAL(debug) << "start()";
  started = true;
  paused = false;

  startTicks = SDL_GetTicks();
  pausedTicks = 0;
}

void LTimer::stop() {
  BOOST_LOG_TRIVIAL(debug) << "stop()";
  started = false;
  paused = false;
  startTicks = 0;
  pausedTicks = 0;
}

void LTimer::pause() {
  // If not started, or already paused, return
  if (!started || paused) return;

  BOOST_LOG_TRIVIAL(debug) << "pause()";

  paused = true;
  pausedTicks = SDL_GetTicks() - startTicks;
  startTicks = 0;
}

void LTimer::resume() {
  if (!started || !paused) return;
  BOOST_LOG_TRIVIAL(debug) << "resume()";

  paused = false;
  startTicks = SDL_GetTicks() - pausedTicks;
  pausedTicks = 0;
}

Uint32 LTimer::getTicks() {
  if (!started) return 0;

  if (paused) {
    return pausedTicks;
  }

  return SDL_GetTicks() - startTicks;
}

bool LTimer::isStarted() { return started; }

bool LTimer::isPaused() { return started && paused; }
