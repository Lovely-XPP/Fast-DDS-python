#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "fastcdr" for configuration "Release"
set_property(TARGET fastcdr APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(fastcdr PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/x64Win64VS2019/fastcdr-2.2.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/x64Win64VS2019/fastcdr-2.2.dll"
  )

list(APPEND _cmake_import_check_targets fastcdr )
list(APPEND _cmake_import_check_files_for_fastcdr "${_IMPORT_PREFIX}/lib/x64Win64VS2019/fastcdr-2.2.lib" "${_IMPORT_PREFIX}/bin/x64Win64VS2019/fastcdr-2.2.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
