SET(SRC_FILES
    "bitmap.cpp"
    "colorconversion.cpp"
    "floatbitmap.cpp"
    "floatbitmap2.cpp"
    "floatbitmap3.cpp"
    "floatbitmap_bilateralfilter.cpp"
    "floatcubemap.cpp"
    "imageformat.cpp"
    "psd.cpp"
    "psheet.cpp"
    "resample.cpp"
    "tgaloader.cpp"
    "texturepacker.cpp"
    "tgawriter.cpp"
)

add_library(sourcesdk_bitmap STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::bitmap ALIAS sourcesdk_bitmap)

target_link_libraries(sourcesdk_bitmap PRIVATE sourcesdk::common sourcesdk::tier0 sourcesdk::tier1 sourcesdk::utils)
target_include_directories(sourcesdk_bitmap PRIVATE "../public/bitmap")
set_target_properties(sourcesdk_bitmap PROPERTIES FOLDER "sourcesdk")

if (WIN32)
    target_sources(sourcesdk_bitmap PRIVATE "floatbitmap4.cpp")
endif()