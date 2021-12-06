PLATFORM = $(shell uname)


## Compilation flags
##comment out one or the other 
##debugging 
CFLAGS = -g 
##release
#CFLAGS = -O3 -DNDEBUG
LDFLAGS=

CFLAGS+= -Wall

ifeq ($(PLATFORM),Darwin)
## Mac OS X
CFLAGS += -m64  -Wno-deprecated
INCLUDEPATH=-I/system/usr/local/include 
LDFLAGS+= -m64 -lc -framework AGL -framework OpenGL -framework GLUT -framework Foundation
else
## Linux
CFLAGS += -m64
INCLUDEPATH  = -I/usr/include/GL/ 
LIBPATH = -L/usr/lib64 -L/usr/X11R6/lib
LDFLAGS+=  -lGL -lglut -lrt -lGLU -lX11 -lm  -lXmu -lXext -lXi
endif


CC = g++ -O3 -Wall $(INCLUDEPATH)


PROGS = pqtest

default: $(PROGS)

pqtest: pqtest.o geom.o basictype.o pqheap.o
	$(CC) -o $@ pqtest.o geom.o  basictype.o pqheap.o $(LDFLAGS)

pqtest.o: pqtest.c  geom.h basictype.h pqheap.h 
	$(CC) -c $(CFLAGS)   pqtest.c  -o $@

geom.o: geom.cpp geom.h 
	$(CC) -c $(CFLAGS)  geom.cpp -o $@

pqheap.o:pqheap.c pqheap.h basictype.h
	$(CC) -c $(CFLAGS)  pqheap.c -o $@

basictype.o: basictype.c basictype.h geom.h
	$(CC) -c $(CFLAGS)  basictype.c -o $@
clean::	
	rm *.o
	rm pqtest


