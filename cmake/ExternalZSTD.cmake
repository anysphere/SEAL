# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license.

FetchContent_Declare(
    zstd
    URL https://github.com/facebook/zstd/releases/download/v1.4.5/zstd-1.4.5.tar.gz
    URL_HASH SHA256=98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e
)
FetchContent_GetProperties(zstd)
if(NOT zstd_POPULATED)
    FetchContent_Populate(zstd)

    set(ZSTD_BUILD_PROGRAMS OFF CACHE BOOL "" FORCE)
    set(ZSTD_BUILD_SHARED OFF CACHE BOOL "" FORCE)
    set(ZLIB_BUILD_STATIC ON CACHE BOOL "" FORCE)
    set(ZSTD_BUILD_TESTS OFF CACHE BOOL "" FORCE)
    set(ZSTD_MULTITHREAD_SUPPORT OFF CACHE BOOL "" FORCE)
    mark_as_advanced(ZSTD_BUILD_CONTRIB)
    mark_as_advanced(ZSTD_BUILD_PROGRAMS)
    mark_as_advanced(ZSTD_BUILD_SHARED)
    mark_as_advanced(ZSTD_BUILD_STATIC)
    mark_as_advanced(ZSTD_BUILD_TESTS)
    mark_as_advanced(ZSTD_LEGACY_SUPPORT)
    mark_as_advanced(ZSTD_MULTITHREAD_SUPPORT)
    mark_as_advanced(ZSTD_PROGRAMS_LINK_SHARED)
    mark_as_advanced(FETCHCONTENT_SOURCE_DIR_ZSTD)
    mark_as_advanced(FETCHCONTENT_UPDATES_DISCONNECTED_ZSTD)

    add_subdirectory(
        ${zstd_SOURCE_DIR}/build/cmake
        EXCLUDE_FROM_ALL)
endif()
