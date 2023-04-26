set(LIBS_PATH ../lib/public)
cmake_path(ABSOLUTE_PATH LIBS_PATH NORMALIZE)

add_library(sourcesdk_tier2 INTERFACE)
add_library(sourcesdk::tier2 ALIAS sourcesdk_tier2)

target_include_directories(sourcesdk_tier2 SYSTEM INTERFACE ../public/tier2)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    # message(WARNING "64-bit tier2 is not supported")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    if (WIN32)
        target_link_libraries(sourcesdk_tier2 INTERFACE ${LIBS_PATH}/tier2.lib)
    elseif(UNIX AND NOT APPLE)
        target_link_libraries(sourcesdk_tier2 INTERFACE ${LIBS_PATH}/linux32/tier2.a)
    else()
        target_link_libraries(sourcesdk_tier2 INTERFACE ${LIBS_PATH}/osx32/tier2.a)
    endif()
endif()
