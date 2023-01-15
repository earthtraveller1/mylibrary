cmake_minimum_required(VERSION 3.13)

project(mylibrary)

add_library(mylibrary src/mylibrary.cpp)
add_library(mylibrary::mylibrary ALIAS mylibrary)

add_library(mylibrary-headers INTERFACE)

target_include_directories(mylibrary-headers INTERFACE)

set_target_properties(mylibrary PROPERTIES PUBLIC_HEADER include/mylibrary.hpp)

install(
    TARGETS mylibrary mylibrary-headers
    EXPORT mylibraryTargets 
    LIBRARY DESTINATION lib
)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/mylibraryConfigVersion.cmake"
    VERSION "1.0.0"
    COMPATIBILITY AnyNewerVersion
)

export(
    EXPORT mylibraryTargets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/mylibraryTargets.cmake"
)

configure_file(
    "${CMAKE_SOURCE_DIR}/cmake/mylibraryConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/mylibraryConfig.cmake"
    COPYONLY
)

set(MYLIBRARY_PACKAGE_DIR "share/mylibrary/cmake")

install(
    EXPORT mylibraryTargets
    FILE mylibraryTargets.cmake
    DESTINATION ${MYLIBRARY_PACKAGE_DIR}
)

install(
    FILES
        "${CMAKE_CURRENT_BINARY_DIR}/mylibraryConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/mylibraryConfigVersion.cmake"
    DESTINATION
        ${MYLIBRARY_PACKAGE_DIR}
)