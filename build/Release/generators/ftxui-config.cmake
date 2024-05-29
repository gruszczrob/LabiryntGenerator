########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(ftxui_FIND_QUIETLY)
    set(ftxui_MESSAGE_MODE VERBOSE)
else()
    set(ftxui_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ftxuiTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${ftxui_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(ftxui_VERSION_STRING "5.0.0")
set(ftxui_INCLUDE_DIRS ${ftxui_INCLUDE_DIRS_RELEASE} )
set(ftxui_INCLUDE_DIR ${ftxui_INCLUDE_DIRS_RELEASE} )
set(ftxui_LIBRARIES ${ftxui_LIBRARIES_RELEASE} )
set(ftxui_DEFINITIONS ${ftxui_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${ftxui_BUILD_MODULES_PATHS_RELEASE} )
    message(${ftxui_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


