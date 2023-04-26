set(SRC_FILES
    "color_conversion.cpp"
    "halton.cpp"
    "lightdesc.cpp"
    "mathlib_base.cpp"
    "powsse.cpp"
    "sparse_convolution_noise.cpp"
    "sseconst.cpp"
    "sse.cpp"
    "ssenoise.cpp"
    "anorms.cpp"
    "bumpvects.cpp"
    "IceKey.cpp"
    "imagequant.cpp"
    "polyhedron.cpp"
    "quantize.cpp"
    "randsse.cpp"
    "spherical.cpp"
    "simdvectormatrix.cpp"
    "vector.cpp"
    "vmatrix.cpp"
    "almostequal.cpp"
)

add_library(sourcesdk_mathlib STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::mathlib ALIAS sourcesdk_mathlib)

target_link_libraries(sourcesdk_mathlib PRIVATE sourcesdk::common sourcesdk::tier0)
target_include_directories(sourcesdk_mathlib SYSTEM PUBLIC ../public/mathlib)
target_compile_definitions(sourcesdk_mathlib PRIVATE RAD_TELEMETRY_DISABLED MATHLIB_LIB)
set_target_properties(sourcesdk_mathlib PROPERTIES FOLDER "sourcesdk")

if(WIN32)
    set_target_properties(sourcesdk_mathlib PROPERTIES LINK_FLAGS_DEBUG "/NODEFAULTLIB:\"libcmt.lib\"")
    target_sources(sourcesdk_mathlib PRIVATE "3dnow.cpp")
elseif(UNIX AND NOT APPLE)
    target_sources(sourcesdk_mathlib PRIVATE "3dnow.cpp")
endif()