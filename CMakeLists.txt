cmake_minimum_required(VERSION 3.20) 
project(fortran-sdl2)
enable_language(Fortran)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/Modules)

if("${CMAKE_Fortran_COMPILER_ID}" STREQUAL "NVHPC")
  message(STATUS "Fortran compiler is Portland, add some compilation options")
  add_definitions(-O2 -Mbackslash)
endif()

#searching for SDL
find_package(SDL2 REQUIRED)
if (SDL2_FOUND)
  message(STATUS "SDL2_LIBRARIES = ${SDL2_LIBRARIES}")
endif()

#searching for others libraries
find_package(SDL2_image REQUIRED)
find_package(SDL2_ttf)
find_package(SDL2_mixer)

# Put libraries in the lib subdirectory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Put executables in the bin subdirectory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# where we are generating Fortran modules
set(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_BINARY_DIR}/mod)

add_subdirectory(src)
add_subdirectory(examples)
