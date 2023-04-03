add_library(sourcesdk_vtf INTERFACE EXCLUDE_FROM_ALL)
add_library(sourcesdk::vtf ALIAS sourcesdk_vtf)

target_link_libraries(sourcesdk_vtf INTERFACE sourcesdk::common sourcesdk::tier0 sourcesdk::tier1 sourcesdk::utils)

if (WIN32)
    set_target_properties(sourcesdk_vtf PROPERTIES LINK_FLAGS_DEBUG "/NODEFAULTLIB:\"libcmt.lib\"")
endif()