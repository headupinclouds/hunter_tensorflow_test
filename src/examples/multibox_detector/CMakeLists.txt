add_executable(multibox_detector main.cc)
target_link_libraries(multibox_detector PUBLIC tensorflow::tensorflow)
install(TARGETS multibox_detector DESTINATION bin)
