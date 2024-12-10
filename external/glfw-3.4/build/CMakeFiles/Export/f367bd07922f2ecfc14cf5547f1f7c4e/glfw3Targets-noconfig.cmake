#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "glfw" for configuration ""
set_property(TARGET glfw APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(glfw PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libglfw.3.4.dylib"
  IMPORTED_SONAME_NOCONFIG "@rpath/libglfw.3.dylib"
  )

list(APPEND _cmake_import_check_targets glfw )
list(APPEND _cmake_import_check_files_for_glfw "${_IMPORT_PREFIX}/lib/libglfw.3.4.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
