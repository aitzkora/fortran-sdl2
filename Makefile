FC          = gfortran9
RPATH       = -Wl,-rpath=/usr/local/lib/gcc9/
SDL_CFLAGS  = `sdl2-config --cflags`
SDL_LDLIBS  = `sdl2-config --libs`
FFLAGS      = -Wall $(RPATH) -std=f2003 -ffree-line-length-none $(SDL_CFLAGS)
LDLIBS      = $(SDL_LDLIBS)
EXAMPLES    = examples

SDL_SRC = sdl2.f90
SDL_OBJ = sdl2.o
IMG_SRC = sdl2_image.f90
IMG_OBJ = sdl2_image.o
MIX_SRC = sdl2_mixer.f90
MIX_OBJ = sdl2_mixer.o
TTF_SRC = sdl2_ttf.f90
TTF_OBJ = sdl2_ttf.o

ALPHA   = alpha
DRAW    = draw
DVD     = dvd
EVENTS  = events
IMAGE   = image
MSGBOX  = msgbox
OPERA   = opera
SCALING = scaling
TEXT    = text
VOXEL   = voxel
WINDOW  = window

.PHONY: all clean examples

all: $(SDL_OBJ) $(IMG_OBJ) $(MIX_OBJ) $(TTF_OBJ)

examples: $(ALPHA) $(DRAW) $(DVD) $(EVENTS) $(IMAGE) $(MSGBOX) $(OPERA) \
          $(SCALING) $(TEXT) $(VOXEL) $(WINDOW)

sdl2: $(SDL_OBJ)

sdl2_image: $(IMG_OBJ)

sdl2_mixer: $(MIX_OBJ)

sdl2_ttf: $(TTF_OBJ)

$(SDL_OBJ):
	$(FC) $(FFLAGS) -c src/$(SDL_SRC)

$(IMG_OBJ):
	$(FC) $(FFLAGS) -c src/$(IMG_SRC)

$(MIX_OBJ):
	$(FC) $(FFLAGS) -c src/$(MIX_SRC)

$(TTF_OBJ):
	$(FC) $(FFLAGS) -c src/$(TTF_SRC)

$(ALPHA): $(EXAMPLES)/$(ALPHA)/$(ALPHA).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

$(DRAW): $(EXAMPLES)/$(DRAW)/$(DRAW).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

$(DVD): $(EXAMPLES)/$(DVD)/$(DVD).f90 $(SDL_OBJ) $(IMG_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS) -lSDL2_image

$(EVENTS): $(EXAMPLES)/$(EVENTS)/$(EVENTS).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

$(IMAGE): $(EXAMPLES)/$(IMAGE)/$(IMAGE).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

$(OPERA): $(EXAMPLES)/$(OPERA)/$(OPERA).f90 $(SDL_OBJ) $(MIX_OBJ) $(TTF_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS) -lSDL2_mixer -lSDL2_ttf

$(MSGBOX): $(EXAMPLES)/$(MSGBOX)/$(MSGBOX).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

$(SCALING): $(EXAMPLES)/$(SCALING)/$(SCALING).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

$(TEXT): $(EXAMPLES)/$(TEXT)/$(TEXT).f90 $(SDL_OBJ) $(TTF_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS) -lSDL2_ttf

$(VOXEL): $(EXAMPLES)/$(VOXEL)/$(VOXEL).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

$(WINDOW): $(EXAMPLES)/$(WINDOW)/$(WINDOW).f90 $(SDL_OBJ)
	$(FC) $(FFLAGS) -o $@ $? $(LDLIBS)

clean:
	if [ `ls -1 *.mod 2>/dev/null | wc -l` -gt 0 ]; then rm *.mod; fi
	if [ -e $(SDL_OBJ) ]; then rm $(SDL_OBJ); fi
	if [ -e $(IMG_OBJ) ]; then rm $(IMG_OBJ); fi
	if [ -e $(MIX_OBJ) ]; then rm $(MIX_OBJ); fi
	if [ -e $(TTF_OBJ) ]; then rm $(TTF_OBJ); fi
	if [ -e $(ALPHA) ]; then rm $(ALPHA); fi
	if [ -e $(DRAW) ]; then rm $(DRAW); fi
	if [ -e $(DVD) ]; then rm $(DVD); fi
	if [ -e $(EVENTS) ]; then rm $(EVENTS); fi
	if [ -e $(IMAGE) ]; then rm $(IMAGE); fi
	if [ -e $(MSGBOX) ]; then rm $(MSGBOX); fi
	if [ -e $(OPERA) ]; then rm $(OPERA); fi
	if [ -e $(SCALING) ]; then rm $(SCALING); fi
	if [ -e $(TEXT) ]; then rm $(TEXT); fi
	if [ -e $(VOXEL) ]; then rm $(VOXEL); fi
	if [ -e $(WINDOW) ]; then rm $(WINDOW); fi
