# kotlin

> Kotlin with Gradle or Bazel; format with ktfmt, lint with detekt, debug in Android Studio or IntelliJ.

# Getting started

- `./gradlew build` - compile, test and lint with the Gradle wrapper
- `./gradlew test` - run the unit tests
- `./gradlew detekt` - lint with detekt, when the plugin is applied

# Everyday

- `./gradlew ktfmtFormat` - format with ktfmt, when the plugin is applied
- `./gradlew lint` - Android Lint on an Android module
- `bazel test //[pkg]/...` - run a Bazel package's tests

# Notes

- Style follows the Kotlin coding conventions and the Android Kotlin Style Guide
- Android Lint runs as a Gradle task, not as a separate tool

# See also

- `cheat android` - build, install and run an Android app
- `cheat android-studio` - the IDE to debug in
- `cheat bazel` - build and test a package
