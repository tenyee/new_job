# cmake_minimum_required(VERSION <specify CMake version here>)
project(demo1)

set(CMAKE_CXX_STANDARD 11)

add_executable(demo1 main.cpp person.cpp person.h)