cmake_minimum_required(VERSION 3.13)

project(mylibrary)

add_library(mylibrary)

add_subdirectory(src)

install(TARGETS mylibrary LIBRARY)
