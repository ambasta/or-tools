CMAKE_MINIMUM_REQUIRED(VERSION 3.8)

SET(LICENSE "Apache License (2.0)")
SET(AUTHOR "Google Inc")
SET(AUTHOR_EMAIL "lperron@google.com")
SET(PROJECT_URI "https://developers.google.com/optimization/")
SET(PROJECT_DESC "Google OR-Tools python libraries and modules")
SET(DOWNLOAD_URI "https://github.com/google/or-tools/releases")

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

INCLUDE(cmake/utils.cmake)
INCLUDE(GenerateExportHeader)
INCLUDE(ExternalProject)
INCLUDE(CMakePackageConfigHelpers)

SET_VERSION(VERSION)

SET(CMAKE_INCLUDE_CURRENT_DIR ON)
SET(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)

PROJECT(ortools LANGUAGES CXX VERSION ${VERSION})
SET(CMAKE_CXX_STANDARD 17)
IF(UNIX)
    IF(NOT APPLE)
        INCLUDE(GNUInstallDirs)
    ELSE()
        SET(CMAKE_INSTALL_LIBDIR lib)
        SET(CMAKE_INSTALL_BINDIR bin)
        SET(CMAKE_INSTALL_INCLUDEDIR include)
    ENDIF()
ELSE()
    SET(CMAKE_INSTALL_LIBDIR lib)
    SET(CMAKE_INSTALL_BINDIR bin)
    SET(CMAKE_INSTALL_INCLUDEDIR include)
ENDIF()

SET(BUILD_CXX OFF CACHE BOOL "Build C++ library")
SET(BUILD_PY OFF CACHE BOOL "Build Python library")
SET(BUILD_DEPS OFF CACHE BOOL "Force re-build of all dependencies")
SET(${PROJECT_NAME}_INCLUDE_DIRS "")

SET(DOWNLOAD_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/downloads" CACHE PATH "Location where external projects will be downloaded.")
LIST(APPEND ${PROJECT_NAME}_INCLUDE_DIRS ${CMAKE_INSTALL_INCLUDEDIR})

MARK_AS_ADVANCED(DOWNLOAD_LOCATION)

FILE(READ ${CMAKE_CURRENT_SOURCE_DIR}/Dependencies.txt _Dependency_file)
FOREACH(DEPENDENCY Protobuf gflags glog Cbc CoinUtils Osi Clp Cgl)
    STRING(REGEX REPLACE ".*${DEPENDENCY} = ([0-9.]+).*" "\\1" ${DEPENDENCY}_VERSION ${_Dependency_file})
ENDFOREACH()

IF(BUILD_PY)
    FIND_PACKAGE(${PROJECT_NAME} QUIET)
    IF(NOT ${PROJECT_NAME}_FOUND)
        SET(BUILD_CXX ON)
    ENDIF()
ENDIF()

FIND_PACKAGE(Threads REQUIRED QUIET)

FIND_PACKAGE(Protobuf ${Protobuf_VERSION} QUIET)
IF(BUILD_DEPS)
    SET(Protobuf_FOUND False)
ENDIF()
IF(NOT Protobuf_FOUND)
    MESSAGE(STATUS "Did not find system protobuf or forced build. Building as an external project")
    INCLUDE(cmake/external/protobuf.cmake)
ENDIF()

SET(PROTOBUF_IMPORT_DIRS ${PROJECT_SOURCE_DIR})
SET(PROTOBUF_GENERATE_CPP_APPEND_PATH OFF)

ADD_DEFINITIONS(-DNDEBUG -DUSE_GLOP -DUSE_BOP)

MESSAGE(STATUS "Build cxx library: ${BUILD_CXX}")
MESSAGE(STATUS "Build python library: ${BUILD_PY}")
MESSAGE(STATUS "Force build dependencies: ${BUILD_DEPS}")

IF(BUILD_CXX)
    INCLUDE(cmake/cpp.cmake)
ENDIF()

MESSAGE("Include dirs: Proto: ${Protobuf_INCLUDE_DIRS} gflags: ${gflags_INCLUDE_DIRS} glog: ${glog_INCLUDE_DIRS} cbc; ${Cbc_INCLUDE_DIRS} ortools: ${${PROJECT_NAME}_INCLUDE_DIRS}")

IF(BUILD_PY)
    INCLUDE(cmake/python.cmake)
ENDIF()
