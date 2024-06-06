cmake_minimum_required(VERSION 3.10)

# Set the project name
project(Cli)

# Define the Cli library
add_library(Cli STATIC 
    Cli.cpp 
    Cli.h
)

target_include_directories(Cli PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Cli PUBLIC DrawingEngine ClassFactory)

