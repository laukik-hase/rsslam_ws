#Update Keys

sudo apt-get update
sudo apt-get upgrade

#Intel Realsense SDK

sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils
sudo apt-get update
sudo apt-get upgrade

#Realsense Firmware Update

#ROS Packages

cd ~
git clone https://github.com/laukik-hase/rsslam_ws
cd rsslam_ws/src
catkin_init_workspace
cd ..
catkin_make -j2
echo "source ~/rsslam_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

cd rtabmap/build
cmake -DCMAKE_INSTALL_PREFIX=~/rsslam_ws/devel ..
make -j2
sudo make -j2 install
echo "source ~/rsslam_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

cd ~
mv rtabmap_ros rsslam_ws/src/rtabmap_ros
cd rsslam_ws
catkin_make -j2
echo "source ~/rsslam_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc





