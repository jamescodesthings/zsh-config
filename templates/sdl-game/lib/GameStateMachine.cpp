#include "GameStateMachine.h"

void GameStateMachine::pushState(GameState* state) {
    states.emplace_back(state);
    if(!states.back()->onEnter()){
        BOOST_LOG_TRIVIAL(warning) << boost::format("State %s onEnter failed") % state->getStateID();
    }
}

void GameStateMachine::popState() {
    if (states.empty()){
        BOOST_LOG_TRIVIAL(warning) << "popState called but states is empty";
        return;
    }
    if(!states.back()->onExit()){
        BOOST_LOG_TRIVIAL(warning) << "Could not cleanup state";
    }

    delete states.back();
    states.pop_back();
}

void GameStateMachine::changeState(GameState* state) {
    if (states.back()->getStateID() == state->getStateID()) {
        BOOST_LOG_TRIVIAL(warning) << boost::format("Attempted to replace State %s with self") % state->getStateID();

        return;
    }

    popState();
    pushState(state);
}

void GameStateMachine::update() {
    if(states.empty()) return;

    // update last state
    states.back()->update();
}

// todo: Could render back to front to get state layers?
void GameStateMachine::render() {
    if(states.empty()) return;

    // render last state
    states.back()->render();
}
