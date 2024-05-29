# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/ftxui-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${ftxui_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${ftxui_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET ftxui::ftxui)
    add_library(ftxui::ftxui INTERFACE IMPORTED)
    message(${ftxui_MESSAGE_MODE} "Conan: Target declared 'ftxui::ftxui'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/ftxui-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()