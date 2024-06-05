# CMake minimum version required
cmake_minimum_required(VERSION 3.10)

# Project name and version
project(LabiryntGenerator VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(SOURCES ./Logs/Logs.cpp ./Logs/Logs.h ./ClassFactory/ClassFactory.cpp ./ClassFactory/ClassFactory.h ./Cli/Cli.cpp ./Cli/Cli.h ./DrawingEngine/DrawingEngine.cpp ./DrawingEngine/DrawingEngine.h ./DrawingEngineFactory/DrawingEngineFactory.cpp ./DrawingEngineFactory/DrawingEngineFactory.h main.cpp)


# Add the executable
add_executable(LabiryntGenerator ${SOURCES})

find_package(ftxui REQUIRED)

target_link_libraries(LabiryntGenerator ftxui::ftxui)
