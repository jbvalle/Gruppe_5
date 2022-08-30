cmake_minimum_required(VERSION 3.16.3)
project(gruppe_v LANGUAGES C CXX)

set(CMAKE_CXX_FLAGS --coverage)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -std=c99")

set(SOURCE_FILES src/main.c inc/project_function.h src/user_interface.c)

add_library(projectLib STATIC src/user_interface.c)

add_executable(gruppe_v src/main.c)

target_include_directories(gruppe_v PRIVATE inc)

target_link_libraries(gruppe_v projectLib)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

include_directories(${GTK3_INCLUDE_DIRS})
link_directories(${GTK3_LIBRARY_DIRS})

add_definitions(${GTK3_CFLAGS_OTHER})


target_link_libraries(gruppe_v ${GTK3_LIBRARIES} projectLib )

include(testing/CMakeLists.txt)
