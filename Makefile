.PHONY= build gcov report test clean run doxy

CMAKE=cmake

BUILD=./build

COV=gcov

COVR=gcovr

COVFLAGS=-r . --html --html-details

COVPATH=./build/CMakeFiles/testRunner.dir/src/

GTEST_PATH=./dependency/googletest

TARGET:= testRunner

all: clean build

build: FORCE
	mkdir -p $@ && $(CMAKE) -B./$(BUILD) && cd $(BUILD) && $(MAKE) 
	cd $(GTEST_PATH) && mkdir -p $(BUILD) && $(CMAKE) -B./$(BUILD) && cd $(BUILD) && $(MAKE) && sudo $(MAKE) install

base-build:
	chmod +x ./main_system_build.sh
	./main_system_build.sh

gcov: FORCE
	cd $(COVPATH) && lcov --capture --directory . --output-file gtest_coverage.info && genhtml gtest_coverage.info --output-directory CODE_COVERAGE

report: FORCE
	firefox ./$(COVPATH)/CODE_COVERAGE/index.html

test: FORCE
	cd $(BUILD) && ./$(TARGET)

run: FORCE
	./build/./gruppe_v

doxy: FORCE
	cd doxy && doxygen Doxyfile && cd doxy_documentation/html && firefox index.html


clean: FORCE
	rm -rf $(BUILD)
	rm -rf $(GTEST_PATH)/$(BUILD)

FORCE:

