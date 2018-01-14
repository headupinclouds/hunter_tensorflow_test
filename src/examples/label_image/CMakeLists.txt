add_executable(label_image main.cc)
target_link_libraries(label_image PUBLIC tensorflow::tensorflow)

#add_whole_archive_flag(tensorflow::tensorflow tf_link_command)
#target_link_libraries(label_image PUBLIC tf_link_command)

#target_include_directories(label_image "/Users/dhirvonen/.hunter/_Base/247d3ca/7dc1807/22b2979/Install/include/")

install(TARGETS label_image DESTINATION bin)
