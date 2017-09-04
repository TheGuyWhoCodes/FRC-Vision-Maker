#!/bin/bash

echo "-----------------------"
echo "Getting all the needed stuff via apt-get"
echo "-----------------------"

sudo apt-get install cmake openjdk-8-jdk ffmpeg ant
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-armhf

echo "-----------------------"
echo "Cloning the current OpenCV git"
echo "-----------------------"

git clone https://github.com/opencv/opencv.git
cd opencv
mkdir build
cd build

echo "-----------------------"
echo "Generating cmake config"
echo "-----------------------"

cmake ..

echo "-----------------------"
echo "Running a make and install"
echo "-----------------------"

make -j4
sudo make install

echo "-----------------------"
echo "Organising Libaries to the Desktop"
echo "-----------------------"

mkdir ~/Desktop/vision/
mkdir ~/Desktop/vision/lib/
cp /usr/local/share/OpenCV/java/libopencv_java330.so ~/Desktop/vision/lib/
mkdir ~/Desktop/vision/jar/
cp /usr/local/share/OpenCV/java/opencv-330.jar ~/Desktop/vision/jar/

echo "-----------------------"
echo "Grabbing the armhf version of NetworkTables"
echo "-----------------------"

wget http://first.wpi.edu/FRC/roborio/maven/release/edu/wpi/first/wpilib/networktables/java/NetworkTables/3.1.7/NetworkTables-3.1.7-armhf.jar -P ~/Desktop/


echo "-----------------------"
echo "Extracting the jar for the libntcore.so file"
echo "-----------------------"

jar xf NetworkTables-3.1.7-armhf.jar

echo "-----------------------"
echo "Removing un-needed files"
echo "-----------------------"

rm -rf edu
rm -rf META-INF

echo "-----------------------"
echo "Copying over libntcore to lib folder"
echo "-----------------------"

cp Linux/arm/libntcore.so ~/Desktop/vision/lib/
cp NetworkTables-3.1.7-armhf.jar ~/Desktop/vision/jar/

rm -rf Linux
rm -rf NetworkTables-3.1.7-armhf.jar

echo "-----------------------"
echo "S.W.A.T. 1806 -- We are done, be sure to fav the github repo @ github.com/TheGuyWhoCodes/FRC-Vision-Maker"
echo "-----------------------"
