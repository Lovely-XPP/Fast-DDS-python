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

cmake_minimum_required(VERSION 3.22)

# Only for release
set(CMAKE_BUILD_TYPE RELEASE)

# SWIG: use standard target name.
if(POLICY CMP0078)
  cmake_policy(SET CMP0078 NEW)
endif()

# SWIG: use SWIG_MODULE_NAME property.
if(POLICY CMP0086)
  cmake_policy(SET CMP0086 NEW)
endif()

project(fastdds_python VERSION 2.1.0)

###############################################################################
# Dependencies
###############################################################################
# Fastdds
add_subdirectory(thirdparty/Fast-DDS)
# OpenSSL
set(ENV{OPENSSL_USE_STATIC_LIBS} TRUE)
set(ENV{OPENSSL_ROOT_DIR} "${PROJECT_SOURCE_DIR}/thirdparty/openssl-3.1.4")
find_package(OpenSSL REQUIRED)
# SWIG
if(WIN32)
  set(SWIG_EXECUTABLE ${PROJECT_SOURCE_DIR}/thirdparty/swig-4.1.1/swig.exe)
  find_package(SWIG)
  if (NOT SWIG_FOUND)
      # Trick to find swig4.1 in Ubuntu noble.
      find_program(SWIG_EXECUTABLE NAMES swig4.1 swig)
      find_package(SWIG REQUIRED)
  endif()
endif(WIN32)
if(APPLE)
  set(SWIG_EXECUTABLE ${PROJECT_SOURCE_DIR}/thirdparty/swig-4.1.1/swig)
  set(SWIG_DIR ${PROJECT_SOURCE_DIR}/thirdparty/swig-4.1.1)
  find_package(SWIG)
  if (NOT SWIG_FOUND)
      # Trick to find swig4.1 in Ubuntu noble.
      find_program(SWIG_EXECUTABLE NAMES swig4.1 swig)
      find_package(SWIG REQUIRED)
  endif()
endif(APPLE)
set(SWIG_LIB_DIR "${PROJECT_SOURCE_DIR}/thirdparty/swig-4.1.1/Lib")

include(${SWIG_USE_FILE})
set(CMAKE_SWIG_FLAGS "-I${SWIG_LIB_DIR}/python" "-I${SWIG_LIB_DIR}")

find_package(Python3 COMPONENTS Interpreter Development REQUIRED)

###############################################################################
# Project subdirectories
###############################################################################

add_subdirectory(src/swig)