set(SRC_FILES
    "raytrace.cpp"
    "trace2.cpp"
    "trace3.cpp"
)

add_library(sourcesdk_raytrace STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::raytrace ALIAS sourcesdk_raytrace)
set_target_properties(sourcesdk_raytrace PROPERTIES FOLDER "sourcesdk")

target_link_libraries(sourcesdk_raytrace PRIVATE sourcesdk::common sourcesdk::tier0 sourcesdk::tier1 sourcesdk::utils)
