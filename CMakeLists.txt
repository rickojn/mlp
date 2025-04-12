cmake_minimum_required(VERSION 3.10)

# Define the project name and languages
project(mlp_project C)

# Define the source files
set(SOURCE_FILES
    src/mlp.c
    src/custard_flow.c
)

# Define the header files (optional, useful for IDE integration)
set(HEADER_FILES
    headers/mlp_types.h
)

# Add executable target
add_executable(mlp ${SOURCE_FILES} ${HEADER_FILES})

# Define custom build types
set(CMAKE_C_FLAGS_DEBUG "-g -fopenmp -Wall -O3")
set(CMAKE_C_FLAGS_RELEASE "-fopenmp -Wall -O3 -DNDEBUG")

# Add custom targets for debug and release
add_custom_target(debug
    COMMAND ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Debug ..
    COMMAND ${CMAKE_COMMAND} --build . --config Debug
    COMMENT "Building in Debug mode"
)

add_custom_target(release
    COMMAND ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Release ..
    COMMAND ${CMAKE_COMMAND} --build . --config Release
    COMMENT "Building in Release mode"
)

# Link the math library (libm)
target_link_libraries(mlp m)