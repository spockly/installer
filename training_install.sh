#!/bin/bash
HOMEPATH=$(pwd)
echo "Updating Linux"
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt-get update
echo "Upgrading Linux"
sudo apt-get upgrade -y
sudo apt-get install libusb-1.0-0-dev libpcap-dev libnetfilter-queue-dev p7zip code terminator curl vim build-essential linux-headers-generic  qttools5-dev qttools5-dev-tools libqt5svg5-dev qtmultimedia5-dev  automake autoconf libgtk2.0-dev libglib2.0-dev flex bison libpcap-dev libgcrypt20-dev cmake apache2 p7zip git net-tools libnetfilter-queue-dev unzip golang libusb-1.0-0-dev nmap libssl-dev libnl-genl-3-dev libnl-idiag-3-200 libnl-idiag-3-dev chromium-browser golang-go -y
cd installers
echo "Installing Wireshark"
wget "https://www.wireshark.org/download/src/wireshark-3.2.6.tar.xz"
tar Jxf wireshark-3.2.6.tar.xz wireshark-3.2.6/
cd wireshark-3.2.6
mkdir build 
cd build
cmake ../
make
sudo make install
echo "Wireshark installed"
cd ../../
echo "Installing VMware"
wget --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0" https://www.vmware.com/go/getplayer-linux
chmod +x getplayer-linux
sudo ./getplayer-linux
echo "installing Metasploit"
sudo chmod +x msfinstall
sudo ./msfinstall
echo "Metasploit is installed"
msfupdate
echo "Installing Hashcat"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
cd installers
wget https://hashcat.net/files/hashcat-6.1.1.7z
sudo p7zip -d hashcat-6.1.1.7z
cd hashcat-6.1.1
sudo cp hashcat64.bin /usr/bin/
sudo ln -s /usr/bin/hashcat64.bin /usr/bin/hashcat
sudo cp -Rv OpenCL/ /usr/bin/
sudo cp hashcat.hcstat2 /usr/bin/
sudo cp hashcat.hctune /usr/bin/
cd ..
echo "Hashcat Installed"
echo "Installing Bettercap"
GOPATH=~/go/bin/
go get github.com/bettercap/bettercap
cd /home/user/go/src/github.com/bettercap/bettercap
make build 
sudo make install
echo "Bettercap Installed"
echo "Installing Aircrack-ng"
cd $HOMEPATH/installer/installers
tar -zxvf aircrack-ng-1.5.2.tar.gz
cd aircrack-ng-1.5.2
autoreconf -i
./configure --with-experimental
make
sudo make install
sudo ldconfig
echo "aircrack installed"
echo "Installing Google Earth"
sudo apt install gdebi-core wget
wget https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
sudo gdebi google-earth-pro-stable_current_amd64.deb 
cd ../../../
echo "Removing installers"
rm -r installers
