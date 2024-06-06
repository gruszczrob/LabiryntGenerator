cmake_minimum_required(VERSION 3.10)

# Set the project name
project(ClassFactory)

# Create a library target for ClassFactory module
add_library(ClassFactory STATIC
	ClassFactory.cpp
	ClassFactory.h
	ClassFactory.tpp
)

# Set the include directory
target_include_directories(ClassFactory PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

