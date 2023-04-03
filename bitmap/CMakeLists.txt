add_library(sourcesdk_bitmap INTERFACE EXCLUDE_FROM_ALL)
add_library(sourcesdk::bitmap ALIAS sourcesdk_bitmap)

target_link_libraries(sourcesdk_bitmap INTERFACE sourcesdk::common sourcesdk::tier0 sourcesdk::tier1 sourcesdk::utils)

if (WIN32)
    set_target_properties(sourcesdk_raytrace PROPERTIES LINK_FLAGS_DEBUG "/NODEFAULTLIB:\"libcmt.lib\"")
endif()