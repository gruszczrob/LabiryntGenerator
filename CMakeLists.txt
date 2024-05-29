# CMake minimum version required
cmake_minimum_required(VERSION 3.10)

# Project name and version
project(LabiryntGenerator VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the executable
add_executable(LabiryntGenerator main.cpp)

find_package(ftxui REQUIRED)

target_link_libraries(LabiryntGenerator ftxui::ftxui)
