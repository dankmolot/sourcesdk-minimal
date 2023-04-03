add_library(sourcesdk_steam_api INTERFACE EXCLUDE_FROM_ALL)
add_library(sourcesdk::steam_api ALIAS sourcesdk_steam_api)

target_link_libraries(sourcesdk_steam_api INTERFACE sourcesdk::common steam_api)
target_include_directories(sourcesdk_steam_api INTERFACE ../public/steam)
