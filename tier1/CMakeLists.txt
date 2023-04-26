set(SRC_FILES
    "bitbuf.cpp"
    "byteswap.cpp"
    "characterset.cpp"
    "checksum_crc.cpp"
    "checksum_md5.cpp"
    "checksum_sha1.cpp"
    "commandbuffer.cpp"
    "convar.cpp"
    "datamanager.cpp"
    "diff.cpp"
    "generichash.cpp"
    "ilocalize.cpp"
    "interface.cpp"
    "KeyValues.cpp"
    "kvpacker.cpp"
    "lzmaDecoder.cpp"
    "mempool.cpp"
    "memstack.cpp"
    "NetAdr.cpp"
    "splitstring.cpp"
    "rangecheckedvar.cpp"
    "reliabletimer.cpp"
    "stringpool.cpp"
    "strtools.cpp"
    "strtools_unicode.cpp"
    "tier1.cpp"
    "tokenreader.cpp"
    "sparsematrix.cpp"
    "uniqueid.cpp"
    "utlbuffer.cpp"
    "utlbufferutil.cpp"
    "utlstring.cpp"
    "utlsymbol.cpp"
    "utlbinaryblock.cpp"
    "snappy.cpp"
    "snappy-sinksource.cpp"
    "snappy-stubs-internal.cpp"
)

add_library(sourcesdk_tier1 STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::tier1 ALIAS sourcesdk_tier1)

target_include_directories(sourcesdk_tier1 SYSTEM PUBLIC ../public/tier1)
target_link_libraries(sourcesdk_tier1 PUBLIC sourcesdk::common sourcesdk::tier0)
target_link_libraries(sourcesdk_tier1 PRIVATE sourcesdk::lzma)
target_compile_definitions(sourcesdk_tier1 PRIVATE RAD_TELEMETRY_DISABLED TIER1_STATIC_LIB)
set_target_properties(sourcesdk_tier1 PROPERTIES FOLDER "sourcesdk")

if (WIN32)
    target_compile_definitions(sourcesdk_tier1 PRIVATE _DLL_EXT=.dll)
    target_sources(sourcesdk_tier1 PRIVATE "processor_detect.cpp")
    set_target_properties(sourcesdk_tier1 PROPERTIES LINK_FLAGS_DEBUG "/NODEFAULTLIB:\"libcmt.lib\"")
    target_link_libraries(sourcesdk_tier1 INTERFACE vstdlib ws2_32 rpcrt4)
elseif(UNIX AND NOT APPLE)
    target_compile_definitions(sourcesdk_tier1 PRIVATE _DLL_EXT=.so)
    target_sources(sourcesdk_tier1 PRIVATE "processor_detect_linux.cpp" "qsort_s.cpp" "pathmatch.cpp")
    target_link_options(sourcesdk_tier1 PRIVATE 
        "-Xlinker --wrap=fopen"
        "-Xlinker --wrap=freopen"
        "-Xlinker --wrap=open"
        "-Xlinker --wrap=creat"
        "-Xlinker --wrap=access"
        "-Xlinker --wrap=__xstat"
        "-Xlinker --wrap=stat"
        "-Xlinker --wrap=lstat"
        "-Xlinker --wrap=fopen64"
        "-Xlinker --wrap=open64"
        "-Xlinker --wrap=opendir"
        "-Xlinker --wrap=__lxstat"
        "-Xlinker --wrap=chmod"
        "-Xlinker --wrap=chown"
        "-Xlinker --wrap=lchown"
        "-Xlinker --wrap=symlink"
        "-Xlinker --wrap=link"
        "-Xlinker --wrap=__lxstat64"
        "-Xlinker --wrap=mknod"
        "-Xlinker --wrap=utimes"
        "-Xlinker --wrap=unlink"
        "-Xlinker --wrap=rename"
        "-Xlinker --wrap=utime"
        "-Xlinker --wrap=__xstat64"
        "-Xlinker --wrap=mount"
        "-Xlinker --wrap=mkfifo"
        "-Xlinker --wrap=mkdir"
        "-Xlinker --wrap=rmdir"
        "-Xlinker --wrap=scandir"
        "-Xlinker --wrap=realpath"
    )
    target_link_libraries(sourcesdk_tier1 INTERFACE vstdlib_srv) # TODO: Make clientside support
else()
    target_compile_definitions(sourcesdk_tier1 PRIVATE _DLL_EXT=.dylib)
    target_sources(sourcesdk_tier1 PRIVATE "processor_detect_linux.cpp")
    target_link_libraries(sourcesdk_tier1 INTERFACE vstdlib iconv)
endif()