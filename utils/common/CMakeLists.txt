add_library(sourcesdk_utils INTERFACE EXCLUDE_FROM_ALL)
add_library(sourcesdk::utils ALIAS sourcesdk_utils)

target_link_libraries(sourcesdk_utils INTERFACE sourcesdk::common sourcesdk::tier0 sourcesdk::tier1)
target_include_directories(sourcesdk_utils SYSTEM INTERFACE ${CMAKE_CURRENT_LIST_DIR})