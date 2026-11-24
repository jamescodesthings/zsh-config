# testing

> Tests across common stacks; `[pkg]` is a bazel package, `[target]` a bazel target.

# Getting started

- `bazel test //[pkg]/...` - every test under a package
- `bazel test [target] --test_filter=[method]` - one method

# Java

- `@Test`, `@ParameterizedTest` - JUnit 5
- `@ExtendWith(MockitoExtension.class)` - Mockito
- `mvn test -Dtest=[Class]#[method]` - one method with maven
- `gradle test --tests [Class.method]` - one method with gradle

# Go

- `go test ./...` - every package
- `go test -run [Name] -v ./[pkg]` - one test, verbose
- `require.NoError(t, [err])` - testify, stops the test

# Mobile

- `xcodebuild test -scheme [scheme] -destination "platform=iOS Simulator,name=[device]"` - iOS XCTest
- `./gradlew connectedAndroidTest` - Espresso on a device or emulator

# See also

- `cheat bazel test` - one class, output, cache
- `cheat java`
- `cheat go`
- `cheat debugging`
