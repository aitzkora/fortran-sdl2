#copy data file into binary directory
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/alpha/fortran.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/image/chess.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/opera/italy.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/pixel/lena.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/scaling/wall.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/voxel/dem.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/voxel/top.bmp DESTINATION ${CMAKE_BINARY_DIR})

# not yet implemented examples : we need libgl
#gl
#gl3d
#glsphere

if (SDL2_TTF_FOUND)
   add_executable(text ${CMAKE_CURRENT_SOURCE_DIR}/text/text.f90)
   target_link_libraries(text sdl2_ttf sdl2 ${SDL2_TTF_LIBARIES} ${SDL2_LIBRARIES})
 endif()

if (SDL2_TTF_FOUND AND SDL2_MIXER_FOUND)
   add_executable(opera ${CMAKE_CURRENT_SOURCE_DIR}/opera/opera.f90)
   target_link_libraries(opera sdl2_ttf sdl2 ${SDL2_TTF_LIBARIES} ${SDL2_MIXER_LIBRARIES} ${SDL2_LIBRARIES})
endif()

# examples with plain sdl2 library
set(examples_sdl 
alpha
cyclic
draw
events
forest
fire
info 
scaling  
vertex
window
log
msgbox
pixel
voxel)

foreach(targ ${examples_sdl})
   add_executable(${targ} ${CMAKE_CURRENT_SOURCE_DIR}/${targ}/${targ}.f90)
   target_link_libraries(${targ} sdl2 ${SDL2_LIBRARIES})
endforeach()

# examples necessiting image library
set(examples_sdl_img
dvd
logo
image
)

foreach(targ ${examples_sdl_img})
   add_executable(${targ} ${CMAKE_CURRENT_SOURCE_DIR}/${targ}/${targ}.f90)
   target_link_libraries(${targ} sdl2 ${SDL2_IMAGE_LIBRARIES} ${SDL2_LIBRARIES})
endforeach()
