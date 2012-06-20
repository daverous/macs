# compile options
CFLAGS = -Wall -g
#CFLAGS = -Wall -O3
LINKFLAGS = 
#LINKFLAGS = -static 

# compiler
CC = g++

# libraries.  For a local Boost installation
# Example:
LIB = -I /Users/garychen/software/boost_1_36_0
# Default:
#LIB = -I .

# simulator name
SIM=macs

OBJS = simulator.o algorithm.o datastructures.o

$(SIM)  : $(OBJS) 
	$(CC) -o $(SIM) $(OBJS) $(LINKFLAGS)

simulator.o: simulator.cpp
	$(CC) $(CFLAGS) $(LIB) -c $<

algorithm.o: algorithm.cpp
	$(CC) $(CFLAGS) $(LIB) -c $<

datastructures.o: datastructures.cpp
	$(CC) $(CFLAGS) $(LIB) -c $<

# MS formatting utility
FORMAT = msformatter

FORMAT_OBJS = msformat.o

$(FORMAT):	$(FORMAT_OBJS) 
		$(CC) -o $(FORMAT) $(FORMAT_OBJS) $(LINKFLAGS)

msformat.o: msformat.cpp
	$(CC) $(CFLAGS) -c $<

all :	$(SIM) $(FORMAT)
clean :
	rm -fr *.o
