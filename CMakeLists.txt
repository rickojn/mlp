cmake_minimum_required(VERSION 3.10)

# Define the project name and languages
project(deep_project C)

# Set compile flags for Debug and Release configurations
set(CMAKE_C_FLAGS_DEBUG "-g -fopenmp -Wall -O3")
set(CMAKE_C_FLAGS_RELEASE "-fopenmp -Wall -O3 -DNDEBUG")

# Define the source files
set(SOURCE_FILES
    src/deep.c
)


# Specify the output binary
add_executable(deep ${SOURCE_FILES})

# Link the math library (libm)
target_link_libraries(deep m)
