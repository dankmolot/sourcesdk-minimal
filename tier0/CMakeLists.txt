add_library(sourcesdk_tier0 INTERFACE)
add_library(sourcesdk::tier0 ALIAS sourcesdk_tier0)

target_include_directories(sourcesdk_tier0 INTERFACE SYSTEM
    ../public/tier0
)

if(WIN32 OR APPLE)
    target_link_libraries(sourcesdk_tier0 INTERFACE tier0)
elseif(UNIX AND CMAKE_SIZEOF_VOID_P EQUAL 4)
    target_link_libraries(sourcesdk_tier0 INTERFACE tier0)
elseif(UNIX AND CMAKE_SIZEOF_VOID_P EQUAL 8)
    target_link_libraries(sourcesdk_tier0 INTERFACE tier0) # TODO: Make client side support
endif()