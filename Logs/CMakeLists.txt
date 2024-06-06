cmake_minimum_required(VERSION 3.10)

# Set the project name
project(Logs)

# Create a library target for Logs module
add_library(Logs STATIC
    	Logs.cpp
	Logs.h
)

# Set the include directory
target_include_directories(Logs PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

