cmake_minimum_required(VERSION 3.13)

project(mylibrary VERSION 1.0)

add_library(mylibrary src/mylibrary.cpp)

include(GNUInstallDirs)

install(
    TARGETS mylibrary
    EXPORT mylibraryTargets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(
    FILES include/mylibrary.hpp
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    COMPONENT Devel
)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/mylibrary/mylibraryConfigVersion.cmake"
    VERSION "1.0"
    COMPATIBILITY AnyNewerVersion
)

export(
    EXPORT mylibraryTargets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/mylibrary/mylibraryTargets.cmake"
    NAMESPACE mylibrary::
)

configure_file(cmake/mylibraryConfig.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/mylibrary/mylibraryStatsConfig.cmake"
    COPYONLY
)

set(ConfigPackageLocation lib/cmake/mylibrary)

install(
    EXPORT mylibraryTargets
    FILE mylibraryTargets.cmake
    NAMESPACE mylibrary::
    DESTINATION ${ConfigPackageLocation}
)

install(
    FILES
        cmake/mylibraryConfig.cmake
        "${CMAKE_CURRENT_BINARY_DIR}/mylibrary/mylibraryConfigVersion.cmake"
    DESTINATION
        ${ConfigPackageLocation}
    COMPONENT
        Devel
)