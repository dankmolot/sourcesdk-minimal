set(SRC_FILES
    "expressioncalculator.cpp"
    "color_conversion.cpp"
    "cholesky.cpp"
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
    "kdop.cpp"
    "imagequant.cpp"
    "spherical.cpp"
    "polyhedron.cpp"
    "quantize.cpp"
    "randsse.cpp"
    "simdvectormatrix.cpp"
    "vmatrix.cpp"
    "almostequal.cpp"
    "simplex.cpp"
    "eigen.cpp"
    "box_buoyancy.cpp"
    "camera.cpp"
    "planefit.cpp"
    "polygon.cpp"
    "volumeculler.cpp"
    "transform.cpp"
    "sphere.cpp"
    "capsule.cpp"
    "noisedata.h"
    "sse.h"
)

add_library(sourcesdk_mathlib STATIC EXCLUDE_FROM_ALL ${SRC_FILES})
add_library(sourcesdk::mathlib ALIAS sourcesdk_mathlib)

target_link_libraries(sourcesdk_mathlib PRIVATE sourcesdk::common sourcesdk::tier0)
target_include_directories(sourcesdk_mathlib PUBLIC "../public/mathlib")
target_compile_definitions(sourcesdk_mathlib PRIVATE MATHLIB_LIB)
set_target_properties(sourcesdk_mathlib PROPERTIES FOLDER "sourcesdk")
