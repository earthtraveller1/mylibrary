vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO earthtraveller1/mylibrary
    REF master # TODO: Insert a real, stable, reference here
    SHA512 # TODO: INSERT HASH HERE
    HEAD_REF master
    )

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

