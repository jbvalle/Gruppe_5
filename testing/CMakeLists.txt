project(testRunner LANGUAGES C CXX)

set(CMAKE_CXX_FLAGS --coverage)

include(FetchContent)
FetchContent_Declare(googletest
        GIT_REPOSITORY https://github.com/google/googletest
        GIT_TAG release-1.11.0)

FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
    FetchContent_Populate(googletest)
    add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BUILD_DIR})
endif()

add_executable(testRunner testing/test.cxx  ../src/user_interface.c ../inc/project_function.h)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

include_directories(${GTK3_INCLUDE_DIRS})
link_directories(${GTK3_LIBRARY_DIRS})

add_definitions(${GTK3_CFLAGS_OTHER})



target_link_libraries(testRunner ${GTK3_LIBRARIES} gtest_main gmock_main)


target_include_directories(gruppe_v PRIVATE ../inc)
