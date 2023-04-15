add_library(sourcesdk_common INTERFACE)
add_library(sourcesdk::common ALIAS sourcesdk_common)

target_link_libraries(sourcesdk_common INTERFACE sourcesdk::internal)

target_compile_definitions(sourcesdk_common INTERFACE
    GAME_DLL # TODO: Make support for client dll
    RAD_TELEMETRY_DISABLED
    GMOD_USE_SOURCESDK
)

target_include_directories(sourcesdk_common INTERFACE SYSTEM 
    ../common
    ../game/shared
    ../public
)

# TODO: Make support for client dll
target_include_directories(sourcesdk_common INTERFACE SYSTEM ../game/server)
