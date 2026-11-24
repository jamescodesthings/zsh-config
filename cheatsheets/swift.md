# swift

> Swift built with Xcode or SwiftPM; SwiftFormat and SwiftLint for style, LLDB and Instruments to debug.

# Getting started

- `swift build` - build a Swift package
- `swift test` - run a package's tests
- `xcodebuild test -scheme [scheme] -destination 'platform=iOS Simulator,name=iPhone 16'` - test an Xcode scheme

# Format and lint

- `swiftformat .` - format with SwiftFormat
- `swiftlint` - lint with SwiftLint
- `swiftlint --fix` - autofix what SwiftLint can

# Config

- `.swiftlint.yml` - SwiftLint rules, at the project root
- `.swiftformat` - SwiftFormat rules, at the project root

# Debugging

- `lldb` - debug with LLDB inside Xcode
- `cmd+r` - run in the simulator, then set breakpoints in the gutter
- `cmd+i` - profile with Instruments, or long-press Run and choose Profile
- `Time Profiler` - the first Instruments template to try

# See also

- `cheat ios` - build and test an iOS app
- `cheat xcode` - drive Xcode
- `cheat bazel` - the build tool, when a project uses it
