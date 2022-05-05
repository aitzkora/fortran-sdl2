#fire example
add_executable(fire ${CMAKE_CURRENT_SOURCE_DIR}/fire/fire.f90)
target_link_libraries(fire sdl2 ${SDL2_LIBRARIES})
