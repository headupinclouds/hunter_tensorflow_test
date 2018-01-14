cmake_minimum_required(VERSION 3.9)

### Hunter snapshot that will be used ###
include("cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.19.216.tar.gz"
    SHA1 "247d3ca881e9c83e6ac419d55cd08d1775ea077a"
    LOCAL # see cmake/Hunter/config.cmake for package customization
)
project(hunter-tensorflow-test)

option(htt_USE_TF_SUBMODULE "Use tensorflow as submodule" ON)

# option(tensorflow_PATH_STATIC_LIB
# option(tensorflow_CUDNN_INCLUDE
# option(tensorflow_PATH_CUDNN_STATIC_LIB
    
option(htt_ENABLE_GPU "Enable the GPU" ON)
option(htt_ENABLE_GRPC_SUPPORT "Enable GRPC" ON)

### Download dependencies ###

# https://github.com/caffe2/caffe2/blob/f2cf8933fc8c04f149ea27f30381517df358c1b5/cmake/Utils.cmake#L173-L185
function(add_whole_archive_flag lib output_var)
  if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(${output_var} -Wl,-force_load,$<TARGET_FILE:${lib}> PARENT_SCOPE)
  elseif(MSVC)
    # In MSVC, we will add whole archive in default.
    set(${output_var} -WHOLEARCHIVE:$<TARGET_FILE:${lib}> PARENT_SCOPE)
  else()
    # Assume everything else is like gcc
    set(${output_var} -Wl,--whole-archive ${lib} -Wl,--no-whole-archive PARENT_SCOPE)
  endif()
endfunction()

hunter_add_package(tensorflow)
find_package(tensorflow CONFIG REQUIRED) # tensorflow::tensorflow

### Targets ###
add_subdirectory(src)

return() # todo

### Testing ###
# enable_testing()

# hunter_add_package(GTest)
# find_package(GTest CONFIG REQUIRED) # GTest::main

# hunter_add_package(gauze)
# find_package(gauze CONFIG REQUIRED)

# add_executable(test test.cpp)
# target_link_libraries(test PUBLIC tensorflow::tensorflow gauze::gauze GTest::main)

# gauze_add_test(
#   NAME SimpleTest 
#   COMMAND test
#   WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}"
#   )
