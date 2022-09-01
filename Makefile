#============#
#== MACROS ==#
#============#
DEBUG=0
#==============#
#== Binaries ==#
#==============#

CC=gcc
CMAKE=cmake
COV=gcov
COVR=gcovr

#====================#
#== Compiler FLAGS ==#
#====================#

GTK_FLAGS=-export-dynamic `pkg-config --libs --cflags gtk+-3.0`
COVFLAGS=-r . --html --html-details

ifeq ($(DEBUG),1)
	CFLAGS=-fprofile-arcs -ftest-coverage -fPIC -lgcov --coverage -O0
else
	CFLAGS=-O3
endif

#===========#
#== PATHS ==#
#===========#

BUILD=./build
COVPATH=./build/CMakeFiles/testRunner.dir/src/
TESTPATH=./testing

#=============================#
#== Source and Object Files ==#
#=============================#

SRCS_DIR=src
SRCS:=$(wildcard $(SRCS_DIR)/*.c)

OBJ_DIR=obj
OBJ:=$(patsubst $(SRCS_DIR)/%.c, $(SRCS_DIR)/$(OBJ_DIR)/%.o, $(SRCS))

#==========================================================================#

#===================#
#== BUILD TARGETS ==#
#===================#

TARGET_MAIN_PROG:=main

all: $(OBJ) $(TARGET_MAIN_PROG)

#==========================#
#== Compile Main Program ==#
#==========================#

$(SRCS_DIR)/$(OBJ_DIR)/%.o: $(SRCS_DIR)/%.c | mk_objdir
	$(CC)  -c -o $@ $^ $(GTK_FLAGS) $(CFLAGS)

$(TARGET_MAIN_PROG): $(OBJ)
	$(CC) $(GCOV_C_FLAGS) -o $@ $^ $(GTK_FLAGS) $(CFLAGS) 

run:
	./$(TARGET_MAIN_PROG)

gcov: FORCE
	gcovr -r . --html -o code_coverage.html

report: FORCE
	firefox ./code_coverage.html

doxy: FORCE
	cd doxy && doxygen Doxyfile && cd doxy_documentation/html && firefox index.html

mk_objdir:
	mkdir -p $(SRCS_DIR)/$(OBJ_DIR)

clean:
	rm -rf $(SRCS_DIR)/$(OBJ_DIR) $(TARGET_MAIN_PROG) *.html *.gcda *.gcno
	$(MAKE) -C $(TESTPATH) clean

switch_gcc:
	sudo apt -y install gcc-9 g++-9 
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9 
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9 
	sudo update-alternatives --config gcc 
	sudo update-alternatives --config g++

#==========================#
#== Install Dependencies ==#
#==========================#

build:
	$(MAKE) -C $(TESTPATH) build

base-build:
	chmod +x ./main_system_build.sh
	./main_system_build.sh


#===============================#
#== Call Test Runner Makefile ==#
#===============================#
test: FORCE
	$(MAKE) -C $(TESTPATH) DEBUG=1
	$(MAKE) -C $(TESTPATH) run
	
FORCE:

#===================#
#== PHONY TARGETS ==#
#===================#
.PHONY=FORCE test base-build mk_objdir doxy report gcov build
