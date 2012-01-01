project(rospy_tutorials)
find_package(ROS COMPONENTS catkin genmsg)

add_message_files(DIRECTORY msg FILES Floats.msg HeaderString.msg)
add_service_files(DIRECTORY srv FILES AddTwoInts.srv BadTwoInts.srv)

generate_messages(DEPENDENCIES std_msgs)

foreach(T
    test/test-add-two-ints.launch
    test/test-peer-subscribe-notify.launch
    test/test-add-two-ints-with-roscpp-server.launch
    test/test-talker-listener.launch
    test/test-talker-listener-with-roscpp.launch
    test/test-on-shutdown.launch
    test/test-connection-header.launch)
  rosbuild_add_rostest(${T})
endforeach()

install(DIRECTORY .
  DESTINATION share/rospy_tutorials
  PATTERN CMakeLists.txt EXCLUDE
  PATTERN catkin.cmake EXCLUDE
  )
enable_python(rospy_tutorials)


