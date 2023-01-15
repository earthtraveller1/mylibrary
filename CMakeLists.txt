cmake_minimum_required(VERSION 3.13)

project(mylibrary)

add_library(mylibrary)
if (NOT "${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    set_target_properties(mylibrary PROPERTIES PUBLIC_HEADER include/mylibrary.hpp)
endif()

install(TARGETS mylibrary EXPORT mylibraryTargets)

add_subdirectory(src)

include(CMakePackageConfigHelpers)
write_basic_package_version_file("${CMAKE_CURRENT_BINARY_DIR}/mylibrary/mylibraryConfigVersion.cmake" VERSION 1.0.0 COMPATIBILITY AnyNewerVersion)
export(EXPORT mylibraryTargets FILE "${CMAKE_CURRENT_BINARY_DIR}/mylibrary/mylibraryTargets.cmake" NAMESPACE Upstream::)
configure_file(cmake/mylibraryConfig.cmake "${CMAKE_CURRENT_BINARY_DIR}/mylibrary/mylibraryConfig.cmake" COPYONLY)

install(FILES "${CMAKE_BINARY_DIR}/mylibrary/mylibraryConfig.cmake"
              "${CMAKE_BINARY_DIR}/mylibrary/mylibraryConfigVersion.cmake"
        DESTINATION "lib/cmake/mylibrary")

install(EXPORT mylibraryTargets FILE mylibraryTargets.cmake EXPORT_LINK_INTERFACE_LIBRARIES DESTINATION "lib/cmake/mylibrary")

