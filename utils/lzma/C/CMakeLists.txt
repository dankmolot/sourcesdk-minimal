set(SRC_FILES
    "7zAlloc.c"
    "7zArcIn.c"
    "7zBuf.c"
    "7zBuf2.c"
    "7zCrc.c"
    "7zCrcOpt.c"
    "7zDec.c"
    "7zFile.c"
    "7zStream.c"
    "Aes.c"
    "AesOpt.c"
    "Alloc.c"
    "Bcj2.c"
    "Bcj2Enc.c"
    "Bra.c"
    "Bra86.c"
    "BraIA64.c"
    "CpuArch.c"
    "Delta.c"
    "DllSecur.c"
    "LzFind.c"
    "Lzma2Dec.c"
    "Lzma2Enc.c"
    "Lzma86Dec.c"
    "Lzma86Enc.c"
    "LzmaDec.c"
    "LzmaEnc.c"
    "LzmaLib.c"
    "Ppmd7.c"
    "Ppmd7Dec.c"
    "Ppmd7Enc.c"
    "Sha256.c"
    "Sort.c"
    "Xz.c"
    "XzCrc64.c"
    "XzCrc64Opt.c"
    "XzDec.c"
    "XzEnc.c"
    "XzIn.c"
)

add_library(sourcesdk_lzma STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::lzma ALIAS sourcesdk_lzma)

target_include_directories(sourcesdk_lzma SYSTEM PUBLIC .)
target_compile_definitions(sourcesdk_lzma PRIVATE _7ZIP_ST)
set_target_properties(sourcesdk_lzma PROPERTIES FOLDER "sourcesdk")

if (WIN32)
    target_sources(sourcesdk_lzma PRIVATE "LzFindMt.c" "Lzma2DecMt.c" "MtCoder.c" "MtDec.c" "Threads.c")
endif()