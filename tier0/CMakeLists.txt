add_library(sourcesdk_tier0 INTERFACE EXCLUDE_FROM_ALL)
add_library(sourcesdk::tier0 ALIAS sourcesdk_tier0)

target_link_libraries(sourcesdk_tier0 INTERFACE sourcesdk::common)
target_include_directories(sourcesdk_tier0 INTERFACE SYSTEM
    ../public/tier0
)

if(WIN32 OR APPLE)
    target_link_libraries(sourcesdk_tier0 INTERFACE tier0)
elseif(UNIX AND NOT APPLE)
    target_link_libraries(sourcesdk_tier0 INTERFACE tier0_srv) # TODO: Make client side support
endif()