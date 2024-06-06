cmake_minimum_required(VERSION 3.10)

# Project name and version
project(LabiryntGenerator VERSION 1.1)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add subdirectories for each module
add_subdirectory(Logs)
add_subdirectory(DrawingEngine)
add_subdirectory(Cli)
add_subdirectory(ClassFactory)
add_subdirectory(DrawingEngineFactory)

# Create the main executable
add_executable(LabiryntGenerator main.cpp)

# Find the FTXUI package
find_package(ftxui REQUIRED)

# Link the modules and FTXUI to the main executable
target_link_libraries(LabiryntGenerator PRIVATE Logs DrawingEngine Cli ClassFactory DrawingEngineFactory ftxui::ftxui)

