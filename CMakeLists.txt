cmake_minimum_required(VERSION 3.16)
project(learn_opengl)

set(CMAKE_CXX_STANDARD 17)

# Include GLFW
find_package(glfw3 REQUIRED)

# Add GLAD library
add_library(glad STATIC external/glad/src/glad.c)

# Set GLAD include directory as a cache variable
set(GLAD_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/external/glad/include CACHE PATH "Path to the GLAD include directory")

# Add executable
add_executable(learn_opengl main.cpp)

# Configure include directories
target_include_directories(glad PRIVATE ${GLAD_INCLUDE_DIR})
target_include_directories(learn_opengl PRIVATE ${GLAD_INCLUDE_DIR})

# Link libraries
target_link_libraries(learn_opengl glfw glad)

# Set output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
