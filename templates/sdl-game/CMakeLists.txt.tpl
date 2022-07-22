cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

# Set project name and version
project($PROJECT_NAME_TITLE LANGUAGES CXX VERSION 1.0.0)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

set(USE_BOOST TRUE) # Boost for logging
set(USE_SDL TRUE) # SDL2
set(USE_SDL_IMAGE TRUE) # SDL2_image
set(USE_SFML FALSE) # SFML
set(HAS_ASSETS_DIR TRUE) # True if we should copy ./Assets to build dir

# Enable debug symbols by default
if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug
    CACHE STRING
    "Choose the type of build (Debug or Release)"
    FORCE
    )
endif ()

message("Configuration:")
message("Build Type: ${CMAKE_BUILD_TYPE}")
message("Use Boost: ${USE_BOOST}")
message("Use SDL: ${USE_SDL}")
message("Use SDL Image: ${USE_SDL_IMAGE}")
message("Use SFML: ${USE_SFML}")
message("Has Assets Dir: ${HAS_ASSETS_DIR}")

# Generate config.h
configure_file(config.h.in config.h)

set(LIBS_TO_LINK)

# Include and Link SFML 2.5
if (USE_SFML)
  message("Using SFML")
  find_package(SFML 2.5
    COMPONENTS
    system window graphics network audio REQUIRED
    )

  set(LIBS_TO_LINK ${LIBS_TO_LINK}
    sfml-audio
    sfml-graphics
    sfml-network
    sfml-system
    sfml-window
    )
endif ()

if (USE_SDL)
  message("Using SDL2")
  # Include and Link SDL2
  find_package(SDL2 REQUIRED)
  message("Include: ${SDL2_INCLUDE_DIRS}")
  include_directories(${SDL2_INCLUDE_DIRS})
  SET(LIBS_TO_LINK ${LIBS_TO_LINK} ${SDL2_LIBRARIES})
endif ()

if (USE_SDL_IMAGE)
  message("Using SDL2")
  find_package(SDL2_image REQUIRED)
  include_directories(${SDL2_IMAGE_INCLUDE_DIRS})
  set(LIBS_TO_LINK ${LIBS_TO_LINK} ${SDL2_IMAGE_LIBRARIES})
endif ()

if (USE_BOOST)
  message("Using Boost")
  SET(Boost_USE_STATIC_LIBS ON)
  find_package(Boost
    1.78
    COMPONENTS log
    REQUIRED
    )
  if (Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS})
    link_directories(/usr/local/opt/icu4c/lib)
    message("Boost VERSION: ${Boost_VERSION}")
    message("Boost INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
    message("Boost Boost_LIBRARY_DIRS: ${Boost_LIBRARY_DIRS}")
    message("Boost LIBRARIES: ${Boost_LIBRARIES}")
    set(LIBS_TO_LINK ${LIBS_TO_LINK} ${Boost_LIBRARIES})
  endif ()
endif ()

# Sources here
set(SOURCES
  $PROJECT_NAME_TITLE.cpp
  lib/LTexture.h
  lib/LTexture.cpp
  )

# Compile executable
add_executable($PROJECT_NAME_TITLE ${SOURCES})

# Set include directory search paths
target_include_directories($PROJECT_NAME_TITLE
  PRIVATE
  "${PROJECT_BINARY_DIR}"
  )

# Link executable to required SFML libraries
message("Linking Libraries: ${LIBS_TO_LINK}")
target_link_libraries($PROJECT_NAME_TITLE ${LIBS_TO_LINK})

if (HAS_ASSETS_DIR)
  # Copy assets
  file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/assets/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/assets/)
endif ()

# Install target
install(TARGETS $PROJECT_NAME_TITLE DESTINATION bin)
