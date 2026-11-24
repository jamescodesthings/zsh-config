# java

> Java with Bazel, Gradle or Maven; google-java-format and Error Prone are the common tools.

# Getting started

- `mvn test` - compile and run the tests with Maven
- `./gradlew build` - compile, test and package with the Gradle wrapper
- `bazel test //[pkg]/...` - every test under a Bazel package

# Build

- `mvn package [-DskipTests]` - build the jar with Maven
- `./gradlew test --tests [Class]` - run one test class with Gradle
- `bazel run //[pkg]` - build and run a Bazel binary

# Format

- `google-java-format -i [files]` - format files in place

# Debug and profile

- `mvn test -Dmaven.surefire.debug` - wait for a debugger on port 5005
- `./gradlew test --debug-jvm` - wait for a debugger on port 5005
- `java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar [jar]` - debug a running jar
- `java -XX:StartFlightRecording=filename=/tmp/p.jfr -jar [jar]` - JFR recording, open it in Java Mission Control

# See also

- `cheat bazel` - build, test and run around the code
- `cheat idea` - IntelliJ setup and keys
- `cheat debugging` - debugging across languages
