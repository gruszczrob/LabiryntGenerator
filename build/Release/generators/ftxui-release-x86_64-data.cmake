########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND ftxui_COMPONENT_NAMES ftxui::screen ftxui::dom ftxui::component)
list(REMOVE_DUPLICATES ftxui_COMPONENT_NAMES)
if(DEFINED ftxui_FIND_DEPENDENCY_NAMES)
  list(APPEND ftxui_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES ftxui_FIND_DEPENDENCY_NAMES)
else()
  set(ftxui_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(ftxui_PACKAGE_FOLDER_RELEASE "/home/rgu/.conan2/p/ftxuib95a8883d5f03/p")
set(ftxui_BUILD_MODULES_PATHS_RELEASE )


set(ftxui_INCLUDE_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/include")
set(ftxui_RES_DIRS_RELEASE )
set(ftxui_DEFINITIONS_RELEASE )
set(ftxui_SHARED_LINK_FLAGS_RELEASE )
set(ftxui_EXE_LINK_FLAGS_RELEASE )
set(ftxui_OBJECTS_RELEASE )
set(ftxui_COMPILE_DEFINITIONS_RELEASE )
set(ftxui_COMPILE_OPTIONS_C_RELEASE )
set(ftxui_COMPILE_OPTIONS_CXX_RELEASE )
set(ftxui_LIB_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/lib")
set(ftxui_BIN_DIRS_RELEASE )
set(ftxui_LIBRARY_TYPE_RELEASE STATIC)
set(ftxui_IS_HOST_WINDOWS_RELEASE 0)
set(ftxui_LIBS_RELEASE ftxui-component ftxui-dom ftxui-screen)
set(ftxui_SYSTEM_LIBS_RELEASE pthread m)
set(ftxui_FRAMEWORK_DIRS_RELEASE )
set(ftxui_FRAMEWORKS_RELEASE )
set(ftxui_BUILD_DIRS_RELEASE )
set(ftxui_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(ftxui_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${ftxui_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${ftxui_COMPILE_OPTIONS_C_RELEASE}>")
set(ftxui_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ftxui_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ftxui_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ftxui_EXE_LINK_FLAGS_RELEASE}>")


set(ftxui_COMPONENTS_RELEASE ftxui::screen ftxui::dom ftxui::component)
########### COMPONENT ftxui::component VARIABLES ############################################

set(ftxui_ftxui_component_INCLUDE_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/include")
set(ftxui_ftxui_component_LIB_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/lib")
set(ftxui_ftxui_component_BIN_DIRS_RELEASE )
set(ftxui_ftxui_component_LIBRARY_TYPE_RELEASE STATIC)
set(ftxui_ftxui_component_IS_HOST_WINDOWS_RELEASE 0)
set(ftxui_ftxui_component_RES_DIRS_RELEASE )
set(ftxui_ftxui_component_DEFINITIONS_RELEASE )
set(ftxui_ftxui_component_OBJECTS_RELEASE )
set(ftxui_ftxui_component_COMPILE_DEFINITIONS_RELEASE )
set(ftxui_ftxui_component_COMPILE_OPTIONS_C_RELEASE "")
set(ftxui_ftxui_component_COMPILE_OPTIONS_CXX_RELEASE "")
set(ftxui_ftxui_component_LIBS_RELEASE ftxui-component)
set(ftxui_ftxui_component_SYSTEM_LIBS_RELEASE pthread)
set(ftxui_ftxui_component_FRAMEWORK_DIRS_RELEASE )
set(ftxui_ftxui_component_FRAMEWORKS_RELEASE )
set(ftxui_ftxui_component_DEPENDENCIES_RELEASE ftxui::dom)
set(ftxui_ftxui_component_SHARED_LINK_FLAGS_RELEASE )
set(ftxui_ftxui_component_EXE_LINK_FLAGS_RELEASE )
set(ftxui_ftxui_component_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(ftxui_ftxui_component_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ftxui_ftxui_component_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ftxui_ftxui_component_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ftxui_ftxui_component_EXE_LINK_FLAGS_RELEASE}>
)
set(ftxui_ftxui_component_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${ftxui_ftxui_component_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${ftxui_ftxui_component_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT ftxui::dom VARIABLES ############################################

set(ftxui_ftxui_dom_INCLUDE_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/include")
set(ftxui_ftxui_dom_LIB_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/lib")
set(ftxui_ftxui_dom_BIN_DIRS_RELEASE )
set(ftxui_ftxui_dom_LIBRARY_TYPE_RELEASE STATIC)
set(ftxui_ftxui_dom_IS_HOST_WINDOWS_RELEASE 0)
set(ftxui_ftxui_dom_RES_DIRS_RELEASE )
set(ftxui_ftxui_dom_DEFINITIONS_RELEASE )
set(ftxui_ftxui_dom_OBJECTS_RELEASE )
set(ftxui_ftxui_dom_COMPILE_DEFINITIONS_RELEASE )
set(ftxui_ftxui_dom_COMPILE_OPTIONS_C_RELEASE "")
set(ftxui_ftxui_dom_COMPILE_OPTIONS_CXX_RELEASE "")
set(ftxui_ftxui_dom_LIBS_RELEASE ftxui-dom)
set(ftxui_ftxui_dom_SYSTEM_LIBS_RELEASE m)
set(ftxui_ftxui_dom_FRAMEWORK_DIRS_RELEASE )
set(ftxui_ftxui_dom_FRAMEWORKS_RELEASE )
set(ftxui_ftxui_dom_DEPENDENCIES_RELEASE ftxui::screen)
set(ftxui_ftxui_dom_SHARED_LINK_FLAGS_RELEASE )
set(ftxui_ftxui_dom_EXE_LINK_FLAGS_RELEASE )
set(ftxui_ftxui_dom_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(ftxui_ftxui_dom_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ftxui_ftxui_dom_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ftxui_ftxui_dom_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ftxui_ftxui_dom_EXE_LINK_FLAGS_RELEASE}>
)
set(ftxui_ftxui_dom_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${ftxui_ftxui_dom_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${ftxui_ftxui_dom_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT ftxui::screen VARIABLES ############################################

set(ftxui_ftxui_screen_INCLUDE_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/include")
set(ftxui_ftxui_screen_LIB_DIRS_RELEASE "${ftxui_PACKAGE_FOLDER_RELEASE}/lib")
set(ftxui_ftxui_screen_BIN_DIRS_RELEASE )
set(ftxui_ftxui_screen_LIBRARY_TYPE_RELEASE STATIC)
set(ftxui_ftxui_screen_IS_HOST_WINDOWS_RELEASE 0)
set(ftxui_ftxui_screen_RES_DIRS_RELEASE )
set(ftxui_ftxui_screen_DEFINITIONS_RELEASE )
set(ftxui_ftxui_screen_OBJECTS_RELEASE )
set(ftxui_ftxui_screen_COMPILE_DEFINITIONS_RELEASE )
set(ftxui_ftxui_screen_COMPILE_OPTIONS_C_RELEASE "")
set(ftxui_ftxui_screen_COMPILE_OPTIONS_CXX_RELEASE "")
set(ftxui_ftxui_screen_LIBS_RELEASE ftxui-screen)
set(ftxui_ftxui_screen_SYSTEM_LIBS_RELEASE m)
set(ftxui_ftxui_screen_FRAMEWORK_DIRS_RELEASE )
set(ftxui_ftxui_screen_FRAMEWORKS_RELEASE )
set(ftxui_ftxui_screen_DEPENDENCIES_RELEASE )
set(ftxui_ftxui_screen_SHARED_LINK_FLAGS_RELEASE )
set(ftxui_ftxui_screen_EXE_LINK_FLAGS_RELEASE )
set(ftxui_ftxui_screen_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(ftxui_ftxui_screen_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ftxui_ftxui_screen_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ftxui_ftxui_screen_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ftxui_ftxui_screen_EXE_LINK_FLAGS_RELEASE}>
)
set(ftxui_ftxui_screen_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${ftxui_ftxui_screen_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${ftxui_ftxui_screen_COMPILE_OPTIONS_C_RELEASE}>")