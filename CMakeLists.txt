cmake_minimum_required(VERSION 3.10)

# Define the project name and languages
project(mlp_project C)

# Set compile flags for Debug and Release configurations
set(CMAKE_C_FLAGS_DEBUG "-g -fopenmp -Wall -O2 -mavx -mavx2 -mfma")
set(CMAKE_C_FLAGS_RELEASE "-fopenmp -Wall -O2 -DNDEBUG -mavx -mavx2 -mfma -march=native")

# Define the source files
set(SOURCE_FILES
    src/mlp.c
)


# Specify the output binary
add_executable(mlp ${SOURCE_FILES})

# Link the math library (libm)
target_link_libraries(mlp m)

# cd build/
# cmake -DCMAKE_BUILD_TYPE=Release ..
# cd ..
# cmake --build build/ --config Release
# ./build/mlp
