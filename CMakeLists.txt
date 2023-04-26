cmake_minimum_required(VERSION 3.20)
project(sourcesdk-minimal)

add_library(sourcesdk_internal INTERFACE)
add_library(sourcesdk::internal ALIAS sourcesdk_internal)

target_compile_definitions(sourcesdk_internal INTERFACE
    RAD_TELEMETRY_DISABLED
    NO_STRING_T
    VECTOR
    VERSION_SAFE_STEAM_API_INTERFACES
    PROTECTED_THINGS_ENABLE
)

if(WIN32)
    target_compile_definitions(sourcesdk_internal INTERFACE _DLL_EXT=.dll WIN32 COMPILER_MSVC)
    set_target_properties(sourcesdk_internal PROPERTIES LINK_FLAGS_DEBUG "/NODEFAULTLIB:\"libcmt.lib\"")
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        target_compile_definitions(sourcesdk_internal INTERFACE COMPILER_MSVC64 PLATFORM_64BITS WIN64 _WIN64)
        target_link_directories(sourcesdk_internal INTERFACE "lib/public/x64")
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        target_compile_definitions(sourcesdk_internal INTERFACE COMPILER_MSVC32)
        target_link_directories(sourcesdk_internal INTERFACE "lib/public")
    endif()
elseif(UNIX AND NOT APPLE)
    target_compile_definitions(sourcesdk_internal INTERFACE 
        _DLL_EXT=.so
        COMPILER_GCC
        POSIX
        _POSIX
        LINUX
        _LINUX
        GNUC
        SWDS
    )
    # target_compile_options(sourcesdk_internal INTERFACE
    #     -Wvolatile
    #     -Wunused-local-typedefs
    #     -Wunused-parameter
    #     -Wstrict-aliasing
    #     -Wunknown-pragmas
    #     -Wundef
    #     -Wignored-attributes
    # )
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        target_compile_definitions(sourcesdk_internal INTERFACE PLATFORM_64BITS)
        target_link_directories(sourcesdk_internal INTERFACE "lib/public/linux64")
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        target_link_directories(sourcesdk_internal INTERFACE "lib/public/linux32")
    endif()
else()
    target_compile_definitions(sourcesdk_internal INTERFACE 
        _DLL_EXT=.dylib
        COMPILER_GCC
        POSIX
        _POSIX
        OSX
        _OSX
        GNUC
        _DARWIN_UNLIMITED_SELECT
        FD_SETSIZE=10240
        OVERRIDE_V_DEFINES
        SWDS
    )
    # target_compile_options(sourcesdk_internal INTERFACE
    #     -Wunused-local-typedef
    #     -Wunused-parameter
    #     -Wunused-private-field
    #     -Woverloaded-virtual
    #     -Wunknown-pragmas
    #     -Wunused-variable
    #     -Wunknown-warning-option
    #     -Wundef
    #     -Wexpansion-to-defined
    # )
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        target_compile_definitions(sourcesdk_internal INTERFACE PLATFORM_64BITS)
        target_link_directories(sourcesdk_internal INTERFACE "lib/public/osx64")
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        target_link_directories(sourcesdk_internal INTERFACE "lib/public/osx32")
    endif()
endif()

add_subdirectory(utils/common)
add_subdirectory(utils/lzma/C)
add_subdirectory(common)
add_subdirectory(interfaces)
add_subdirectory(tier0)
add_subdirectory(tier1)
add_subdirectory(tier2)
add_subdirectory(tier3)
add_subdirectory(mathlib)
add_subdirectory(raytrace)
add_subdirectory(bitmap)
add_subdirectory(vtf)
add_subdirectory(steam_api)

# Let everyone know that sourcesdk was included
set(SOURCESDK_FOUND TRUE CACHE INTERNAL "SOURCESDK_FOUND")