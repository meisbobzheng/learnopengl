cmake_minimum_required(VERSION 3.16)
project(learn_opengl)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_OSX_ARCHITECTURES arm64)

# Add SDL2 as a subdirectory
add_subdirectory(external/sdl-2.3)

# Include GLAD
add_library(glad STATIC external/glad/src/glad.c)
set(GLAD_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/external/glad/include CACHE PATH "Path to the GLAD include directory")
target_include_directories(glad PUBLIC ${GLAD_INCLUDE_DIR})

# Add executable
add_executable(learn_opengl main.cpp)

# Configure include directories
target_include_directories(learn_opengl PRIVATE ${GLAD_INCLUDE_DIR} external/sdl-2.3/include)

# Link libraries
target_link_libraries(learn_opengl SDL2-static glad)

# Link macOS frameworks
if(APPLE)
    target_link_libraries(learn_opengl "-framework OpenGL" "-framework Cocoa" "-framework IOKit")
endif()

# Set output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
