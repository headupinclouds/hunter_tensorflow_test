hunter_config(nsync VERSION ${HUNTER_nsync_VERSION} CMAKE_ARGS NSYNC_LANGUAGE=c++11)
hunter_config(c-ares VERSION ${HUNTER_c-ares_VERSION} CMAKE_ARGS CARES_STATIC=ON CARES_SHARED=OFF)
hunter_config(Eigen VERSION v0.0.0-429aa5254200-p0)

if(htt_USE_TF_SUBMODULE)
  hunter_config(tensorflow GIT_SUBMODULE "src/3rdparty/tensorflow")
endif()

