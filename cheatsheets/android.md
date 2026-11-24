# android

> Android apps: build with Gradle, install and debug with adb.

# Getting started

- `./gradlew installDebug` - build and install the app on a device
- `adb devices` - list connected devices and emulators
- `adb logcat` - stream the device log

# Everyday

- `./gradlew assembleDebug` - build only
- `adb install [-r] [path/to/app.apk]` - install the built apk by hand
- `adb shell pm clear [package]` - wipe an app's data
- `adb reverse tcp:[port] tcp:[port]` - expose a host port to the device
- `adb shell am start -n [package]/[activity]` - start an activity

# Notes

- Set ANDROID_HOME and put its platform-tools on PATH for adb
- For an emulator, use Android Studio's Device Manager

# Variables

- `ANDROID_HOME` - the Android SDK folder

# See also

- `cheat android-studio` - open the project and sync it
- `cheat kotlin` - formatting and linting
- `cheat bazel` - an alternative build tool
