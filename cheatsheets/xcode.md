# xcode

> Xcode and its command line tools: projects, simulators and builds.

# Getting started

- `xed .` - open the project in Xcode
- `cmd+r` - build and run in the simulator
- `xcodebuild -list` - schemes and targets in the project

# Project

- `xcode-select -p` - the active developer directory
- `sudo xcode-select -s [path/to/Xcode.app]` - switch the active Xcode
- `xcodebuild -version` - the installed Xcode and SDK versions

# Command line

- `xcodebuild -scheme [name] -destination [dest] build` - build from the terminal
- `xcodebuild -scheme [name] -destination [dest] test` - run the tests
- `xcrun simctl list devices` - available simulators
- `xcrun simctl boot [device]` - start a simulator

# Keys

- `cmd+shift+o` - open quickly by file name

# See also

- `cheat ios` - build and test an iOS app
- `cheat swift` - style, lint and profiling
- `cheat bazel` - a build tool that can generate Xcode projects
