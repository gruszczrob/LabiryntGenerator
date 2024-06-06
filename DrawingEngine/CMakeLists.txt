cmake_minimum_required(VERSION 3.10)

# Set the project name
project(DrawingEngine)

# Create a library target for DrawingEngine module
add_library(DrawingEngine STATIC
	DrawingEngine.cpp
	DrawingEngine.h
)

# Set the include directory
target_include_directories(DrawingEngine PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(DrawingEngine PUBLIC ClassFactory)

