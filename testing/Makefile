#============#
#== Macros ==#
#============#

DEBUG=0

#=================================#
#== Compiler and Compiler FLAGS ==#
#=================================#

CC_CPP=g++

LFLAGS+=-lpthread
INCFLAGS+=-I./googletest/include
GTK_FLAGS=`pkg-config --libs --cflags gtk+-3.0`

# Conditional Compiler flags in debug mode
ifeq ($(DEBUG),1)
	CFLAGS=-g -fprofile-arcs -ftest-coverage -fPIC -lgcov --coverage -O0
else
	CFLAGS=-O3
endif

#=============================#
#== Build Binary PATH GTEST ==#
#=============================#
GTEST_BUILD=./googletest/build
GTEST_ROOT=./googletest/

#======================#
#== Static Libraries ==#
#======================#

GTEST_LIB=./googletest/build/lib/libgtest.a

#=============================#
#== Object and Source files ==#
#=============================#

SRCS_CPP=$(wildcard *.cxx)

OBJ_DIR=obj
OBJ_CXX=$(patsubst %.cxx, $(OBJ_DIR)/%.o, $(SRCS_CPP))

OBJ_PATH_C:=../src/obj
OBJ_C_RAW:=$(wildcard $(OBJ_PATH_C)/*.o)
OBJ_C:=$(filter-out $(OBJ_PATH_C)/main.o,  $(OBJ_C_RAW))

TARGET:=test_runner

all: $(OBJ_CXX) $(TARGET)

#=============================#
#== Generate Testrunner Bin ==#
#=============================#

$(OBJ_DIR)/%.o: %.cxx | mkdir_objdir
	$(CC_CPP) -c -o $@ $^ $(LFLAGS) $(INCFLAGS) $(GTK_FLAGS) 

$(TARGET): $(OBJ_CXX) $(OBJ_C)
	$(CC_CPP) $(CFLAGS) -o $@ $^ $(GTEST_LIB) $(LFLAGS) $(INCFLAGS) $(GTK_FLAGS)

#===========================#
#== Miscellaneous Targets ==#
#===========================#

build:
	cd $(GTEST_ROOT) && mkdir -p build && cd ./build && cmake .. && make

run:
	./$(TARGET)

mkdir_objdir:
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_CXX) $(TARGET) $(GTEST_BUILD)

show:
	@echo $(OBJ_C_RAW)
	@echo $(OBJ_C)

.PHONY= clean mkdir_objdir run
