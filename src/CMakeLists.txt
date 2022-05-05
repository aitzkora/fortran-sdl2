# GLOB is bad, but we do not want to be too much verbose
file(GLOB sdl_sources ${CMAKE_CURRENT_SOURCE_DIR}/sdl2/*.f90)
set(sdl_sources ${sdl_sources} c_util.f90 sdl2.f90)
add_library(sdl2 ${sdl_sources})
target_link_libraries(sdl2 ${SDL2_LIBRARIES})

#image library
add_library(sdl2_image sdl2_image.f90)
target_link_libraries(sdl2_image ${SDL2_IMAGE_LIBRARIES})

#mixer library
#add_library(sdl2_mixer sdl2_mixer.f90)
#target_link_libraries(sdl2_mixer ${SDL2_MIXER_LIBRARIES})
#
##ttf library
#add_library(sdl2_ttf sdl2_ttf.f90)
#target_link_libraries(sdl2_ttf ${SDL2_TTF_LIBRARIES})
