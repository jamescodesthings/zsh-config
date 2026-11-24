# idea

> IntelliJ IDEA and its `idea` launcher; macOS keys.

# Getting started

- `idea [folder]` - open a folder or project
- `idea --line [N] [file]` - open a file at a line
- `idea diff [left] [right]` - compare two files

# Command line

- `idea format [-r] [file]` - format with the IDE's style

# Keys

- `shift shift`, `cmd+shift+a` - search everywhere, find action
- `cmd+b`, `alt+enter` - declaration, quick fix
- `cmd+alt+l`, `alt+f12` - reformat, terminal pane

# Debugging

- Remote JVM Debug on `localhost:5005` - attach to a JVM started with `-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005`
- `bazel test [target] --java_debug` - wait for a debugger on port 5005 before running tests

# See also

- `cheat bazel` - build and test around the IDE
- `cheat buf` - protobuf lint and breaking checks
- `cheat java` - build, debug and profile Java
