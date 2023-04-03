set(LIBS_PATH ../lib/public)
cmake_path(ABSOLUTE_PATH LIBS_PATH NORMALIZE)

add_library(sourcesdk_tier3 INTERFACE EXCLUDE_FROM_ALL)
add_library(sourcesdk::tier3 ALIAS sourcesdk_tier3)

target_include_directories(sourcesdk_tier3 INTERFACE ../public/tier3)

if (WIN32)
    target_link_libraries(sourcesdk_tier3 INTERFACE ${LIBS_PATH}/tier3.lib)
elseif(UNIX AND NOT APPLE)
    target_link_libraries(sourcesdk_tier3 INTERFACE ${LIBS_PATH}/linux32/tier3.a)
else()
    target_link_libraries(sourcesdk_tier3 INTERFACE ${LIBS_PATH}/osx32/tier3.a)
endif()