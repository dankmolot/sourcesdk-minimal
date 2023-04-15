set(SRC_FILES
    "appinstance.cpp"
    "bitbuf.cpp"
    "newbitbuf.cpp"
    "byteswap.cpp"
    "characterset.cpp"
    "checksum_crc.cpp"
    "checksum_md5.cpp"
    "checksum_sha1.cpp"
    "circularbuffer.cpp"
    "commandbuffer.cpp"
    "convar.cpp"
    "datamanager.cpp"
    "diff.cpp"
    "exprevaluator.cpp"
    "generichash.cpp"
    "interface.cpp"
    "keyvalues.cpp"
    "keyvaluesjson.cpp"
    "kvpacker.cpp"
    "lzmaDecoder.cpp"
    "lzss.cpp"
    "mempool.cpp"
    "memstack.cpp"
    "NetAdr.cpp"
    "splitstring.cpp"
    "rangecheckedvar.cpp"
    "stringpool.cpp"
    "strtools.cpp"
    "strtools_unicode.cpp"
    "tier1.cpp"
    "tier1_logging.cpp"
    "timeutils.cpp"
    "uniqueid.cpp"
    "utlbuffer.cpp"
    "utlbufferutil.cpp"
    "utlsoacontainer.cpp"
    "utlstring.cpp"
    "utlsymbol.cpp"
    "miniprofiler_hash.cpp"
    "sparsematrix.cpp"
    "memoverride_dummy.cpp"
)

add_library(sourcesdk_tier1 STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::tier1 ALIAS sourcesdk_tier1)

target_include_directories(sourcesdk_tier1 PUBLIC "../public/tier1" "../common/xbox")
target_link_libraries(sourcesdk_tier1 PUBLIC sourcesdk::common sourcesdk::tier0 sourcesdk::interfaces)
target_link_libraries(sourcesdk_tier1 PRIVATE sourcesdk::lzma)
target_compile_definitions(sourcesdk_tier1 PRIVATE TIER1_STATIC_LIB)
set_target_properties(sourcesdk_tier1 PROPERTIES FOLDER "sourcesdk")

if (WIN32)
    target_compile_definitions(sourcesdk_tier1 PRIVATE _CRT_SECURE_NO_WARNINGS)
    target_sources(sourcesdk_tier1 PRIVATE "processor_detect.cpp")
    target_link_libraries(sourcesdk_tier1 INTERFACE vstdlib ws2_32 rpcrt4)
elseif(UNIX AND NOT APPLE)
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
    target_link_libraries(sourcesdk_tier1 INTERFACE vstdlib) # TODO: Make clientside support
else()
    target_sources(sourcesdk_tier1 PRIVATE "processor_detect_linux.cpp")
    target_link_libraries(sourcesdk_tier1 INTERFACE vstdlib iconv)
endif()