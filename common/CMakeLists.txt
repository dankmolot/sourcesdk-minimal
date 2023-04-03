add_library(sourcesdk_common INTERFACE EXCLUDE_FROM_ALL)
add_library(sourcesdk::common ALIAS sourcesdk_common)

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

if(WIN32) # Windows platform
    target_compile_definitions(sourcesdk_common INTERFACE WIN32)
    target_link_directories(sourcesdk_common INTERFACE ../lib/public)
    set_target_properties(sourcesdk_common PROPERTIES LINK_FLAGS_DEBUG "/NODEFAULTLIB:\"libcmt\"")
elseif(UNIX AND NOT APPLE)
    target_compile_definitions(sourcesdk_common INTERFACE
        COMPILER_GCC
        POSIX
        _POSIX
        LINUX
        _LINUX
        GNUC
        NO_MALLOC_OVERRIDE
    )
    target_link_directories(sourcesdk_common INTERFACE ../lib/public/linux32)
else()
    target_compile_definitions(sourcesdk_common INTERFACE
        COMPILER_GCC
        POSIX
        _POSIX
        OSX
        GNUC
        NO_MALLOC_OVERRIDE
    )
    target_link_directories(sourcesdk_common INTERFACE ../lib/public/osx32)
endif()
