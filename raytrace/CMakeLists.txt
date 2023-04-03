set(SRC_FILES
    "raytrace.cpp"
    "trace2.cpp"
    "trace3.cpp"
)

add_library(sourcesdk_raytrace STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::raytrace ALIAS sourcesdk_raytrace)

target_link_libraries(sourcesdk_raytrace PRIVATE sourcesdk::common sourcesdk::tier0 sourcesdk::tier1 sourcesdk::utils)

if (WIN32)
    set_target_properties(sourcesdk_raytrace PROPERTIES LINK_FLAGS_DEBUG "/NODEFAULTLIB:\"libcmt.lib\"")
endif()