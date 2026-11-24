# debugging

> Debuggers and profilers for Java, Go, iOS and Android; `[pid]` is a process id.

# Getting started

- `bazel test [target] --java_debug --test_output=streamed` - wait for a debugger on port 5005
- `jcmd [pid] JFR.start duration=120s filename=p.jfr` - record a running JVM

# Java

- `jstack [pid]` - thread dump of a running JVM
- `jcmd [pid] GC.heap_dump [file].hprof` - heap dump to open in a profiler

# Go

- `dlv test ./[pkg]` - run tests under delve
- `dlv debug ./[pkg]` - build and debug a main package
- `go tool pprof [file].pprof` - inspect a profile, then `top 10`

# iOS and Android

- `lldb` - debug inside Xcode
- `cmd+i` - Instruments; try Time Profiler first
- `adb logcat` - stream the device log
- `Run > Profile` - Android Studio profiler

# See also

- `cheat java`
- `cheat go`
- `cheat testing`
