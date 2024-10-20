#!/bin/bash
set -e
set -x

ROS_VERSION="noetic"

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros-noetic.list > /dev/null

sudo apt-get -y update
sudo apt-get -y upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
	ros-${ROS_VERSION}-cyclonedds \
	ros-${ROS_VERSION}-rmw-cyclonedds-cpp \
	ros-${ROS_VERSION}-gps-msgs \
	python3-rosdep \
	python3-colcon-common-extensions \
	libgflags-dev \
	libgstreamer-plugins-base1.0-dev \
	gstreamer1.0-plugins-base \
	gstreamer1.0-plugins-good \
	gstreamer1.0-plugins-bad \
	gstreamer1.0-plugins-ugly \
	libopencv-dev \
	libeigen3-dev \
	libimage-exiftool-perl \
	libxml2-utils \
	pkg-config \
	protobuf-compiler


sudo apt install ros-noetic-actuator-msgs 

#Too big
# ros-${ROS_VERSION}-desktop \
#APT INSTALL 22.04?
#gazebo \
#libgazebo11\
#libgazebo-dev \
