cmake_minimum_required(VERSION 3.10)

# Set the project name
project(DrawingEngineFactory)

# Create a library target for DrawingEngineFactory module
add_library(DrawingEngineFactory STATIC
	DrawingEngineFactory.cpp
	DrawingEngineFactory.h
)

# Set the include directory
target_include_directories(DrawingEngineFactory PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(DrawingEngineFactory PUBLIC DrawingEngine Cli ClassFactory)

