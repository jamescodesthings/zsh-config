# ios

> Build, run and test an iOS app with Xcode and the command line.
> Xcode is the IDE; xcodebuild and simctl cover the terminal.

# Getting started

- `xed .` - open the project in Xcode, then cmd+r to run in the simulator
- `xcodebuild -list` - schemes and targets in the project
- `xcrun simctl list devices` - available simulators

# Setup

- `xcode-select --install` - install the command line tools
- `xcodebuild -version` - the Xcode and SDK versions in use

# Everyday

- `xcodebuild -scheme [name] -destination 'platform=iOS Simulator,name=[device]' test` - run the tests
- `xcrun simctl install booted [path/to/App.app]` - install an app in the booted simulator
- `xcrun simctl launch booted [bundle-id]` - start it
- `xcrun simctl erase all` - reset every simulator

# See also

- `cheat xcode` - the project, simulator and xcodebuild commands
- `cheat swift` - style, lint and profiling
- `cheat bazel` - build and test targets
