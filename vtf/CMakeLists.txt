set(SOURCES
    "vtf.cpp"
    "convert_x360.cpp"
    "cvtf.h"
)

add_library(sourcesdk_vtf STATIC EXCLUDE_FROM_ALL ${SOURCES})
add_library(sourcesdk::vtf ALIAS sourcesdk_vtf)

target_link_libraries(sourcesdk_vtf PRIVATE sourcesdk::common sourcesdk::tier0 sourcesdk::tier1 sourcesdk::utils sourcesdk::bitmap)

if(WIN32)
    target_sources(sourcesdk_vtf PRIVATE "s3tc_decode.cpp" "s3tc_decode.h")
endif()
