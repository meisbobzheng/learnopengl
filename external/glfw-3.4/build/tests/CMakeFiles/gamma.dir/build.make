# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/gamma.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/gamma.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/gamma.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/gamma.dir/flags.make

tests/CMakeFiles/gamma.dir/codegen:
.PHONY : tests/CMakeFiles/gamma.dir/codegen

tests/CMakeFiles/gamma.dir/gamma.c.o: tests/CMakeFiles/gamma.dir/flags.make
tests/CMakeFiles/gamma.dir/gamma.c.o: /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/tests/gamma.c
tests/CMakeFiles/gamma.dir/gamma.c.o: tests/CMakeFiles/gamma.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/gamma.dir/gamma.c.o"
	cd /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tests/CMakeFiles/gamma.dir/gamma.c.o -MF CMakeFiles/gamma.dir/gamma.c.o.d -o CMakeFiles/gamma.dir/gamma.c.o -c /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/tests/gamma.c

tests/CMakeFiles/gamma.dir/gamma.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/gamma.dir/gamma.c.i"
	cd /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/tests/gamma.c > CMakeFiles/gamma.dir/gamma.c.i

tests/CMakeFiles/gamma.dir/gamma.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/gamma.dir/gamma.c.s"
	cd /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/tests/gamma.c -o CMakeFiles/gamma.dir/gamma.c.s

# Object files for target gamma
gamma_OBJECTS = \
"CMakeFiles/gamma.dir/gamma.c.o"

# External object files for target gamma
gamma_EXTERNAL_OBJECTS =

tests/gamma.app/Contents/MacOS/gamma: tests/CMakeFiles/gamma.dir/gamma.c.o
tests/gamma.app/Contents/MacOS/gamma: tests/CMakeFiles/gamma.dir/build.make
tests/gamma.app/Contents/MacOS/gamma: src/libglfw.3.4.dylib
tests/gamma.app/Contents/MacOS/gamma: tests/CMakeFiles/gamma.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable gamma.app/Contents/MacOS/gamma"
	cd /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gamma.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/gamma.dir/build: tests/gamma.app/Contents/MacOS/gamma
.PHONY : tests/CMakeFiles/gamma.dir/build

tests/CMakeFiles/gamma.dir/clean:
	cd /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/gamma.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/gamma.dir/clean

tests/CMakeFiles/gamma.dir/depend:
	cd /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4 /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/tests /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/tests /Users/bobzheng/Projects/opengl/learnopengl/external/glfw-3.4/build/tests/CMakeFiles/gamma.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/gamma.dir/depend

