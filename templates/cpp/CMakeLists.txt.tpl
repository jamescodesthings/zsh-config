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

SET(Boost_USE_STATIC_LIBS ON)
find_package(Boost
  1.78
  COMPONENTS log
  REQUIRED
)

set(LIBS_TO_LINK)

if (Boost_FOUND)
  include_directories(${Boost_INCLUDE_DIRS})
  link_directories(/usr/local/opt/icu4c/lib)
  message("Boost VERSION: ${Boost_VERSION}")
  message("Boost INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
  message("Boost Boost_LIBRARY_DIRS: ${Boost_LIBRARY_DIRS}")
  message("Boost LIBRARIES: ${Boost_LIBRARIES}")
  set(LIBS_TO_LINK ${Boost_LIBRARIES})
endif ()

# Sources here
set(SOURCES
  $PROJECT_NAME_TITLE.cpp
)

# Compile executable
add_executable($PROJECT_NAME_TITLE ${SOURCES})

# Set include directory search paths
target_include_directories($PROJECT_NAME_TITLE
        PRIVATE
        "${PROJECT_BINARY_DIR}"
        )

# Link executable to required SFML libraries
target_link_libraries($PROJECT_NAME_TITLE
  sfml-audio
  sfml-graphics
  sfml-network
  sfml-system
  sfml-window
  ${LIBS_TO_LINK}
)

# Copy assets
# file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/graphics/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/graphics/)
# file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/fonts/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/fonts/)
# file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/sound/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/sound/)

# Install target
install(TARGETS $PROJECT_NAME_TITLE DESTINATION bin)

