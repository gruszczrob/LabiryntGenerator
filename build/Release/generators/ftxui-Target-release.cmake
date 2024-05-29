# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(ftxui_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(ftxui_FRAMEWORKS_FOUND_RELEASE "${ftxui_FRAMEWORKS_RELEASE}" "${ftxui_FRAMEWORK_DIRS_RELEASE}")

set(ftxui_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET ftxui_DEPS_TARGET)
    add_library(ftxui_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET ftxui_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${ftxui_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${ftxui_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:ftxui::screen;ftxui::dom>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### ftxui_DEPS_TARGET to all of them
conan_package_library_targets("${ftxui_LIBS_RELEASE}"    # libraries
                              "${ftxui_LIB_DIRS_RELEASE}" # package_libdir
                              "${ftxui_BIN_DIRS_RELEASE}" # package_bindir
                              "${ftxui_LIBRARY_TYPE_RELEASE}"
                              "${ftxui_IS_HOST_WINDOWS_RELEASE}"
                              ftxui_DEPS_TARGET
                              ftxui_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "ftxui"    # package_name
                              "${ftxui_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${ftxui_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT ftxui::component #############

        set(ftxui_ftxui_component_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(ftxui_ftxui_component_FRAMEWORKS_FOUND_RELEASE "${ftxui_ftxui_component_FRAMEWORKS_RELEASE}" "${ftxui_ftxui_component_FRAMEWORK_DIRS_RELEASE}")

        set(ftxui_ftxui_component_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET ftxui_ftxui_component_DEPS_TARGET)
            add_library(ftxui_ftxui_component_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET ftxui_ftxui_component_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'ftxui_ftxui_component_DEPS_TARGET' to all of them
        conan_package_library_targets("${ftxui_ftxui_component_LIBS_RELEASE}"
                              "${ftxui_ftxui_component_LIB_DIRS_RELEASE}"
                              "${ftxui_ftxui_component_BIN_DIRS_RELEASE}" # package_bindir
                              "${ftxui_ftxui_component_LIBRARY_TYPE_RELEASE}"
                              "${ftxui_ftxui_component_IS_HOST_WINDOWS_RELEASE}"
                              ftxui_ftxui_component_DEPS_TARGET
                              ftxui_ftxui_component_LIBRARIES_TARGETS
                              "_RELEASE"
                              "ftxui_ftxui_component"
                              "${ftxui_ftxui_component_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET ftxui::component
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_LIBRARIES_TARGETS}>
                     )

        if("${ftxui_ftxui_component_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET ftxui::component
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         ftxui_ftxui_component_DEPS_TARGET)
        endif()

        set_property(TARGET ftxui::component APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET ftxui::component APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET ftxui::component APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_LIB_DIRS_RELEASE}>)
        set_property(TARGET ftxui::component APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET ftxui::component APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_component_COMPILE_OPTIONS_RELEASE}>)

    ########## COMPONENT ftxui::dom #############

        set(ftxui_ftxui_dom_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(ftxui_ftxui_dom_FRAMEWORKS_FOUND_RELEASE "${ftxui_ftxui_dom_FRAMEWORKS_RELEASE}" "${ftxui_ftxui_dom_FRAMEWORK_DIRS_RELEASE}")

        set(ftxui_ftxui_dom_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET ftxui_ftxui_dom_DEPS_TARGET)
            add_library(ftxui_ftxui_dom_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET ftxui_ftxui_dom_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'ftxui_ftxui_dom_DEPS_TARGET' to all of them
        conan_package_library_targets("${ftxui_ftxui_dom_LIBS_RELEASE}"
                              "${ftxui_ftxui_dom_LIB_DIRS_RELEASE}"
                              "${ftxui_ftxui_dom_BIN_DIRS_RELEASE}" # package_bindir
                              "${ftxui_ftxui_dom_LIBRARY_TYPE_RELEASE}"
                              "${ftxui_ftxui_dom_IS_HOST_WINDOWS_RELEASE}"
                              ftxui_ftxui_dom_DEPS_TARGET
                              ftxui_ftxui_dom_LIBRARIES_TARGETS
                              "_RELEASE"
                              "ftxui_ftxui_dom"
                              "${ftxui_ftxui_dom_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET ftxui::dom
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_LIBRARIES_TARGETS}>
                     )

        if("${ftxui_ftxui_dom_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET ftxui::dom
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         ftxui_ftxui_dom_DEPS_TARGET)
        endif()

        set_property(TARGET ftxui::dom APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET ftxui::dom APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET ftxui::dom APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_LIB_DIRS_RELEASE}>)
        set_property(TARGET ftxui::dom APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET ftxui::dom APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_dom_COMPILE_OPTIONS_RELEASE}>)

    ########## COMPONENT ftxui::screen #############

        set(ftxui_ftxui_screen_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(ftxui_ftxui_screen_FRAMEWORKS_FOUND_RELEASE "${ftxui_ftxui_screen_FRAMEWORKS_RELEASE}" "${ftxui_ftxui_screen_FRAMEWORK_DIRS_RELEASE}")

        set(ftxui_ftxui_screen_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET ftxui_ftxui_screen_DEPS_TARGET)
            add_library(ftxui_ftxui_screen_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET ftxui_ftxui_screen_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'ftxui_ftxui_screen_DEPS_TARGET' to all of them
        conan_package_library_targets("${ftxui_ftxui_screen_LIBS_RELEASE}"
                              "${ftxui_ftxui_screen_LIB_DIRS_RELEASE}"
                              "${ftxui_ftxui_screen_BIN_DIRS_RELEASE}" # package_bindir
                              "${ftxui_ftxui_screen_LIBRARY_TYPE_RELEASE}"
                              "${ftxui_ftxui_screen_IS_HOST_WINDOWS_RELEASE}"
                              ftxui_ftxui_screen_DEPS_TARGET
                              ftxui_ftxui_screen_LIBRARIES_TARGETS
                              "_RELEASE"
                              "ftxui_ftxui_screen"
                              "${ftxui_ftxui_screen_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET ftxui::screen
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_LIBRARIES_TARGETS}>
                     )

        if("${ftxui_ftxui_screen_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET ftxui::screen
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         ftxui_ftxui_screen_DEPS_TARGET)
        endif()

        set_property(TARGET ftxui::screen APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET ftxui::screen APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET ftxui::screen APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_LIB_DIRS_RELEASE}>)
        set_property(TARGET ftxui::screen APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET ftxui::screen APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${ftxui_ftxui_screen_COMPILE_OPTIONS_RELEASE}>)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET ftxui::ftxui APPEND PROPERTY INTERFACE_LINK_LIBRARIES ftxui::component)
    set_property(TARGET ftxui::ftxui APPEND PROPERTY INTERFACE_LINK_LIBRARIES ftxui::dom)
    set_property(TARGET ftxui::ftxui APPEND PROPERTY INTERFACE_LINK_LIBRARIES ftxui::screen)

########## For the modules (FindXXX)
set(ftxui_LIBRARIES_RELEASE ftxui::ftxui)
