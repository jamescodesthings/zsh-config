cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

# Set project name and version
project($PROJECT_NAME_TITLE LANGUAGES CXX VERSION 1.0.0)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# Enable debug symbols by default
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug
    CACHE STRING
      "Choose the type of build (Debug or Release)"
      FORCE
    )
endif()

# Generate config.h
configure_file(config.h.in config.h)

# Find SFML shared libraries
find_package(SFML 2.5
  COMPONENTS
    system window graphics network audio REQUIRED
  )

# Compile executable
add_executable($PROJECT_NAME_TITLE $PROJECT_NAME_TITLE.cpp)

# Set include directory search paths
target_include_directories($PROJECT_NAME_TITLE
        PRIVATE
        "${PROJECT_BINARY_DIR}"
        )

# Link executable to required SFML libraries
target_link_libraries($PROJECT_NAME_TITLE sfml-graphics sfml-audio)

# Copy assets
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/graphics/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/graphics/)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/fonts/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/fonts/)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/sound/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/sound/)

# Install target
install(TARGETS $PROJECT_NAME_TITLE DESTINATION bin)

