#copy data file into binary directory
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/alpha/fortran.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/image/chess.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/opera/italy.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/pixel/lena.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/scaling/wall.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/voxel/dem.bmp DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/voxel/top.bmp DESTINATION ${CMAKE_BINARY_DIR})

# not yet implemented examples : we need sdl_ttf and sdl_mixer and libgl
#gl
#gl3d
#glsphere
#opera
#text

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
