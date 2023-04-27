add_library(sourcesdk_common INTERFACE)
add_library(sourcesdk::common ALIAS sourcesdk_common)

target_link_libraries(sourcesdk_common INTERFACE sourcesdk::internal)

target_compile_definitions(sourcesdk_common INTERFACE
    RAD_TELEMETRY_DISABLED
    GMOD_USE_SOURCESDK
)

if(CLIENT_DLL)
    target_compile_definitions(sourcesdk_common INTERFACE CLIENT_DLL)
    target_include_directories(sourcesdk_common SYSTEM INTERFACE ../game/client)
else()
    target_compile_definitions(sourcesdk_common INTERFACE GAME_DLL)
    target_include_directories(sourcesdk_common SYSTEM INTERFACE ../game/server)
endif()

target_include_directories(sourcesdk_common SYSTEM INTERFACE 
    ../common
    ../game/shared
    ../public
)
