# Copyright 2022 Proyectos y Sistemas de Mantenimiento SL (eProsima).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

###############################################################################
# Compile python wrapper with SWIG
###############################################################################

message(STATUS "Configuring FastDDS wrapper for Python...")

set(${PROJECT_NAME}_MODULE
    fastdds
    )

set(${PROJECT_NAME}_FILE
    ${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_MODULE}.i
    )

file(COPY ${${PROJECT_NAME}_MODULE}.i 
     DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
    )

set_source_files_properties(${${PROJECT_NAME}_FILE} PROPERTIES
    CPLUSPLUS ON
    USE_TARGET_INCLUDE_DIRECTORIES TRUE
    INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}
    )

option(BUILD_DOCUMENTATION "Use doxygen to create product documentation" OFF)
if (BUILD_DOCUMENTATION)
    set(CMAKE_SWIG_FLAGS "-doxygen")
endif (BUILD_DOCUMENTATION)

set(OPENSSL_USE_STATIC_LIBS TRUE)

swig_add_library(${PROJECT_NAME}
    TYPE SHARED
    LANGUAGE python
    SOURCES
    ${${PROJECT_NAME}_FILE}
    )

if(UNIX AND CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_property(TARGET ${PROJECT_NAME} PROPERTY
        SWIG_COMPILE_DEFINITIONS SWIGWORDSIZE64
        )
endif()

if(MSVC OR MSVC_IDE)
    target_compile_options(${PROJECT_NAME} PRIVATE /bigobj)
endif()

target_link_libraries(${PROJECT_NAME}
    Python3::Module
    fastcdr
    fastdds
    ${OPENSSL_LIBRARIES}
    )

###############################################################################
# Generate setup.py
###############################################################################
file(WRITE 
    ${PROJECT_SOURCE_DIR}/binary/setup.py 
    "# Generate by CMake, Do not EDIT.
import setuptools
import sysconfig

setuptools.setup(
    name='fastdds',
    version='${PROJECT_VERSION}',
    description='Python bindings for Fast DDS.',
    author='',
    author_email='',
    python_requires=f'==\{sysconfig.get_python_version()\}.*',
    packages=setuptools.find_packages(),
   	include_package_data=True
)"
)

# pyproject.toml
file(WRITE 
    ${PROJECT_SOURCE_DIR}/binary/pyproject.toml
    "# Generate by CMake, Do not EDIT.
[build-system]
requires = [\"setuptools\"]
build-backend = \"setuptools.build_meta\"
    "
)

# MANIFEST.in
file(WRITE 
    ${PROJECT_SOURCE_DIR}/binary/MANIFEST.in
    "# Generate by CMake, Do not EDIT.
recursive-include fastdds *.pyd
recursive-include fastdds *.dylib
recursive-include fastdds *.so
recursive-include fastdds *.dll
    "
)

###############################################################################
# Copy binary
###############################################################################
# modify fastdds.py
if(WIN32)
    add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND powershell -Command "(Get-Content '$<TARGET_FILE_DIR:${PROJECT_NAME}>/../fastdds.py') -replace 'if\ __import__', '# if  __import__' | Set-Content '$<TARGET_FILE_DIR:${PROJECT_NAME}>/../fastdds.py'"
    COMMAND_EXPAND_LISTS
    VERBATIM
)
endif(WIN32)

# generate wheel files
if(WIN32)
    add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_SOURCE_DIR}/binary/fastdds
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "$<TARGET_FILE_DIR:${PROJECT_NAME}>/_fastdds_python.pyd"
            "$<TARGET_FILE_DIR:${PROJECT_NAME}>/../fastdds.py"
            ${PROJECT_SOURCE_DIR}/binary/fastdds
    COMMAND ${CMAKE_COMMAND} -E rename 
            ${PROJECT_SOURCE_DIR}/binary/fastdds/fastdds.py
            ${PROJECT_SOURCE_DIR}/binary/fastdds/__init__.py
    COMMAND pip install build
    COMMAND pip install ${PROJECT_SOURCE_DIR}/binary
    COMMAND python -m build ${PROJECT_SOURCE_DIR}/binary
    COMMAND ${CMAKE_COMMAND} -E copy_if_different 
        ${PROJECT_SOURCE_DIR}/binary/dist/fastdds-${PROJECT_VERSION}-py3-none-any.whl 
        ${PROJECT_SOURCE_DIR}/binary/wheels/fastdds-${PROJECT_VERSION}-cp${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR}-cp${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR}-win_amd64.whl 
    COMMAND_EXPAND_LISTS
    VERBATIM
)
endif(WIN32)

if(APPLE)
    execute_process(
        COMMAND sw_vers -productVersion
        OUTPUT_VARIABLE MACOS_VERSION
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    string(REGEX MATCH "[0-9]+" MACOS_VERSION_MAJOR "${MACOS_VERSION}")
    message(STATUS "Detected macOS version: ${MACOS_VERSION_MAJOR}")
    add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_SOURCE_DIR}/binary/fastdds
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "$<TARGET_FILE_DIR:${PROJECT_NAME}>/fastdds.py"
            ${PROJECT_SOURCE_DIR}/binary/fastdds/__init__.py
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "$<TARGET_FILE_DIR:${PROJECT_NAME}>/_fastdds_python.dylib"
            ${PROJECT_SOURCE_DIR}/binary/fastdds/_fastdds_python.so
    COMMAND pip install build
    COMMAND pip install ${PROJECT_SOURCE_DIR}/binary
    COMMAND python3 -m build ${PROJECT_SOURCE_DIR}/binary
    COMMAND ${CMAKE_COMMAND} -E copy_if_different 
        ${PROJECT_SOURCE_DIR}/binary/dist/fastdds-${PROJECT_VERSION}-py3-none-any.whl 
        ${PROJECT_SOURCE_DIR}/binary/wheels/fastdds-${PROJECT_VERSION}-cp${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR}-cp${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR}-macosx_${MACOS_VERSION_MAJOR}_0_${CMAKE_HOST_SYSTEM_PROCESSOR}.whl 
    COMMAND_EXPAND_LISTS
    VERBATIM
)
endif(APPLE)

