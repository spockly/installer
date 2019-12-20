#!/bin/bash
echo "Updating Linux"
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt-get update
echo "Upgrading Linux"
sudo apt-get upgrade -y
sudo apt-get install curl vim build-essential linux-headers-generic  qttools5-dev qttools5-dev-tools libqt5svg5-dev qtmultimedia5-dev build-essential automake autoconf libgtk2.0-dev libglib2.0-dev flex bison libpcap-dev libgcrypt20-dev cmake apache2 p7zip git -y
cd installers
echo "Installing Wireshark"
wget "https://2.na.dl.wireshark.org/src/wireshark-3.2.0.tar.xz"
tar Jxf wireshark-3.2.0.tar.xz wireshark-3.2.0/
mkdir build 
cd build
cmake ../wireshark-3.2.0
make
sudo make install
echo "Wireshark installed"
cd ..
echo "Installing VMware"
sudo chmod +x 'VMware-Workstation-Full-15.5.1-15018445.x86_64.bundle' 
sudo ./'VMware-Workstation-Full-15.5.1-15018445.x86_64.bundle'
echo "installing Metasploit"
sudo chmod +x msfinstall
sudo ./msfinstall
echo "Metasploit is installed"
msfupdate
echo "Installing Hashcat"
sudo apt install -y ocl-icd-libopencl1 nvidia-driver-435 nvidia-cuda-toolkit
sudo apt-get install mesa-common-dev
sudo apt-get install freeglut3-dev -y
cd installers
sudo p7zip -d hashcat-5.1.0.7z
cd hashcat-5.1.0.7
sudo cp hashcat64.bin /usr/bin/
sudo ln -s /usr/bin/hashcat64.bin /usr/bin/hashcat
sudo cp -Rv OpenCL/ /usr/bin/
sudo cp hashcat.hcstat2 /usr/bin/
sudo cp hashcat.hctune /usr/bin/
cd ../..
echo "Hashcat installed"
echo "Removing installers"
rm -r installers
