# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ishak/MicroMouse/src/Gtest_MM_brain

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ishak/MicroMouse/src/Gtest_MM_brain

# Include any dependencies generated for this target.
include CMakeFiles/runTestsSample.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/runTestsSample.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/runTestsSample.dir/flags.make

CMakeFiles/runTestsSample.dir/sample.cpp.o: CMakeFiles/runTestsSample.dir/flags.make
CMakeFiles/runTestsSample.dir/sample.cpp.o: sample.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ishak/MicroMouse/src/Gtest_MM_brain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/runTestsSample.dir/sample.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/runTestsSample.dir/sample.cpp.o -c /home/ishak/MicroMouse/src/Gtest_MM_brain/sample.cpp

CMakeFiles/runTestsSample.dir/sample.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/runTestsSample.dir/sample.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ishak/MicroMouse/src/Gtest_MM_brain/sample.cpp > CMakeFiles/runTestsSample.dir/sample.cpp.i

CMakeFiles/runTestsSample.dir/sample.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/runTestsSample.dir/sample.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ishak/MicroMouse/src/Gtest_MM_brain/sample.cpp -o CMakeFiles/runTestsSample.dir/sample.cpp.s

# Object files for target runTestsSample
runTestsSample_OBJECTS = \
"CMakeFiles/runTestsSample.dir/sample.cpp.o"

# External object files for target runTestsSample
runTestsSample_EXTERNAL_OBJECTS =

runTestsSample: CMakeFiles/runTestsSample.dir/sample.cpp.o
runTestsSample: CMakeFiles/runTestsSample.dir/build.make
runTestsSample: /usr/lib/x86_64-linux-gnu/libgtest.a
runTestsSample: CMakeFiles/runTestsSample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ishak/MicroMouse/src/Gtest_MM_brain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable runTestsSample"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/runTestsSample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/runTestsSample.dir/build: runTestsSample

.PHONY : CMakeFiles/runTestsSample.dir/build

CMakeFiles/runTestsSample.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/runTestsSample.dir/cmake_clean.cmake
.PHONY : CMakeFiles/runTestsSample.dir/clean

CMakeFiles/runTestsSample.dir/depend:
	cd /home/ishak/MicroMouse/src/Gtest_MM_brain && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ishak/MicroMouse/src/Gtest_MM_brain /home/ishak/MicroMouse/src/Gtest_MM_brain /home/ishak/MicroMouse/src/Gtest_MM_brain /home/ishak/MicroMouse/src/Gtest_MM_brain /home/ishak/MicroMouse/src/Gtest_MM_brain/CMakeFiles/runTestsSample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/runTestsSample.dir/depend
