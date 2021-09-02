cmake_minimum_required(VERSION 3.18)

project(dimcli-natural-static)

set(CMAKE_CXX_STANDARD 17)

include(FetchContent)

FetchContent_Declare(
  dimcli
  URL https://github.com/gknowles/dimcli/archive/refs/tags/v6.1.0.zip
)
FetchContent_GetProperties(dimcli)
if(NOT dimcli_POPULATED)
  FetchContent_Populate(dimcli)
  add_library(dimcli STATIC ${dimcli_SOURCE_DIR}/libs/dimcli/cli.cpp)
  target_include_directories(dimcli PUBLIC ${dimcli_SOURCE_DIR}/libs)
endif()

add_executable(test main.cpp)
target_link_libraries(test PRIVATE dimcli)
