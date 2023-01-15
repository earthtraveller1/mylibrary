cmake_minimum_required(VERSION 3.13)

project(mylibrary)

add_library(mylibrary)
set_target_properties(mylibrary PROPERTIES PUBLIC_HEADER include/mylibrary.hpp)

add_subdirectory(src)

install(TARGETS mylibrary LIBRARY PUBLIC_HEADER)
