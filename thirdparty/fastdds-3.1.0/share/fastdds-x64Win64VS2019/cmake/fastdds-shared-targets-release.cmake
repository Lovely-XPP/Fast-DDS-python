#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "fastdds" for configuration "Release"
set_property(TARGET fastdds APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(fastdds PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/x64Win64VS2019/fastdds-3.1.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "fastcdr;foonathan_memory"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/x64Win64VS2019/fastdds-3.1.dll"
  )

list(APPEND _cmake_import_check_targets fastdds )
list(APPEND _cmake_import_check_files_for_fastdds "${_IMPORT_PREFIX}/lib/x64Win64VS2019/fastdds-3.1.lib" "${_IMPORT_PREFIX}/bin/x64Win64VS2019/fastdds-3.1.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
