cmake_minimum_required(VERSION 3.20)
project(sourcesdk-minimal)

add_subdirectory(utils/common)
add_subdirectory(utils/lzma/C)
add_subdirectory(common)
add_subdirectory(tier0)
add_subdirectory(tier1)
add_subdirectory(tier2)
add_subdirectory(tier3)
add_subdirectory(mathlib)
add_subdirectory(raytrace)
add_subdirectory(bitmap)
add_subdirectory(vtf)
add_subdirectory(steam_api)

# Let everyone know that sourcesdk was included
set(SOURCESDK_FOUND TRUE CACHE INTERNAL "SOURCESDK_FOUND")