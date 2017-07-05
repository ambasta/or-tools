SET(ADD_CXXFLAGS "-DCBC_THREAD_SAFE -DCBC_NO_INTERRUPT")

FOREACH(COIN_PROJECT CoinUtils Osi Clp Cgl Cbc)
    SET(${COIN_PROJECT}_URL https://github.com/coin-or/${COIN_PROJECT}.git)

    ExternalProject_Add(${COIN_PROJECT}_project
            PREFIX ${COIN_PROJECT}
            GIT_REPOSITORY ${${COIN_PROJECT}_URL}
            GIT_TAG "releases/${${COIN_PROJECT}_VERSION}"
            DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
            UPDATE_COMMAND ""
            BUILD_IN_SOURCE 1
            CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${COIN_PROJECT}/src/${COIN_PROJECT}_project/configure
            --enable-silent-rules --disable-bzlib --without-lapack --with-pic --enable-static --prefix=${CMAKE_CURRENT_BINARY_DIR}/install
            ADD_CXXFLAGS=${ADD_CXXFLAGS})

    ADD_LIBRARY(${COIN_PROJECT} STATIC IMPORTED)
    SET_PROPERTY(TARGET ${COIN_PROJECT}
        PROPERTY IMPORTED_LOCATION
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/install/lib/lib${COIN_PROJECT}.a>)
    SET_PROPERTY(TARGET ${COIN_PROJECT}
        PROPERTY INCLUDE_DIRECTORIES 
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/install/include>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}>)

    IF (${COIN_PROJECT} STREQUAL "Cbc" OR ${COIN_PROJECT} STREQUAL "Clp")
        ADD_LIBRARY(Osi${COIN_PROJECT} STATIC IMPORTED)
        SET_PROPERTY(TARGET Osi${COIN_PROJECT}
            PROPERTY IMPORTED_LOCATION
            $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/install/lib/libOsi${COIN_PROJECT}.a>)
        ADD_LIBRARY(${COIN_PROJECT}Solver STATIC IMPORTED)
        SET_PROPERTY(TARGET ${COIN_PROJECT}Solver
            PROPERTY IMPORTED_LOCATION
            $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/install/lib/lib${COIN_PROJECT}Solver.a>)
    ENDIF()

    ADD_DEPENDENCIES(${COIN_PROJECT} ${COIN_PROJECT}_project)
ENDFOREACH()

ADD_DEPENDENCIES(Osi_project CoinUtils_project)
ADD_DEPENDENCIES(Clp_project Osi_project)
ADD_DEPENDENCIES(Cgl_project Clp_project)
ADD_DEPENDENCIES(Cbc_project Cgl_project)

SET_PROPERTY(TARGET Osi PROPERTY INTERFACE_LINK_LIBRARIES CoinUtils)
SET_PROPERTY(TARGET Clp PROPERTY INTERFACE_LINK_LIBRARIES Osi)
SET_PROPERTY(TARGET OsiClp PROPERTY INTERFACE_LINK_LIBRARIES Clp)
SET_PROPERTY(TARGET ClpSolver PROPERTY INTERFACE_LINK_LIBRARIES Clp)
SET_PROPERTY(TARGET Cgl PROPERTY INTERFACE_LINK_LIBRARIES Clp)
SET_PROPERTY(TARGET Cbc PROPERTY INTERFACE_LINK_LIBRARIES Cgl)
SET_PROPERTY(TARGET OsiCbc PROPERTY INTERFACE_LINK_LIBRARIES Cbc)
SET_PROPERTY(TARGET CbcSolver PROPERTY INTERFACE_LINK_LIBRARIES Cbc)

SET(Cbc_LIBRARIES "")
LIST(APPEND Cbc_LIBRARIES Cbc OsiCbc CbcSolver ClpSolver OsiClp)

INSTALL(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/install/include/coin
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}
    COMPONENT Devel)
