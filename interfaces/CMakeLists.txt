add_library(sourcesdk_interfaces STATIC EXCLUDE_FROM_ALL "interfaces.cpp")
add_library(sourcesdk::interfaces ALIAS sourcesdk_interfaces)
set_target_properties(sourcesdk_interfaces PROPERTIES FOLDER "sourcesdk")

target_link_libraries(sourcesdk_interfaces PUBLIC sourcesdk::common)
target_include_directories(sourcesdk_interfaces PRIVATE "../public/interfaces/")
