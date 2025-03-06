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

# SWIG: use standard target name.
if(POLICY CMP0078)
  cmake_policy(SET CMP0078 NEW)
endif()

# SWIG: use SWIG_MODULE_NAME property.
if(POLICY CMP0086)
  cmake_policy(SET CMP0086 NEW)
endif()

project(fastdds_python VERSION 2.2.0)

# Set BUILD_TESTING to OFF by default.
if(NOT BUILD_TESTING)
    message(STATUS "Tests not compiled by default")
    set(BUILD_TESTING OFF CACHE BOOL "Enable testing" FORCE)
endif()

# disable MSVC warning
if(MSVC)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /w")
endif(MSVC)

###############################################################################
# Dependencies
###############################################################################
# Fastdds
add_subdirectory(thirdparty/Fast-DDS)
# OpenSSL
set(ENV{OPENSSL_USE_STATIC_LIBS} TRUE)
set(ENV{OPENSSL_ROOT_DIR} "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/openssl-3.1.4")
set(OPENSSL_USE_STATIC_LIBS TRUE)
set(OPENSSL_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/openssl-3.1.4")
find_package(OpenSSL REQUIRED)
# SWIG
# WIN32
if(WIN32)
  set(SWIG_EXECUTABLE ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/swig-4.1.1/swig.exe)
  find_package(SWIG REQUIRED)
endif(WIN32)
# APPLE
if(APPLE)
  set(SWIG_EXECUTABLE ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/swig-4.1.1/swig)
  set(SWIG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/swig-4.1.1)
  find_package(SWIG REQUIRED)
endif(APPLE)
# Trick to find swig4.1 in Ubuntu noble.
if (NOT SWIG_FOUND)
  find_program(SWIG_EXECUTABLE NAMES swig4.1 swig)
  find_package(SWIG REQUIRED)
endif()
set(SWIG_LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/swig-4.1.1/Lib")
include(${SWIG_USE_FILE})
set(CMAKE_SWIG_FLAGS "-I${SWIG_LIB_DIR}/python" "-I${SWIG_LIB_DIR}")

find_package(Python3 COMPONENTS Interpreter Development REQUIRED)

###############################################################################
# Project subdirectories
###############################################################################

add_subdirectory(src/swig)

###############################################################################
# Testing options
###############################################################################
# enable_testing()
include(CTest)

if (BUILD_TESTING)
  add_subdirectory(test)
endif()
