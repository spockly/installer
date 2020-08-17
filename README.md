       This will install Hashcat/VM Player/Google Earth/Aircrack/Wireshark
       
    1. Reboot into drive and boot into installer using F12 (you may need to disable secure boot in bios)
    2. Select Ubuntu
    3. Select Install Ubuntu
    4. on Keyboard layout click continue
    5. Setup Internet connection
    6. Selection Normal Installation, Download updates and Install Third Party Software
    7. Erase disk and install Ubuntu
        1. select Advanced features.
        2. Enable LVM with Ubuntu and encrypt
        3. Enter password
    8. Select drive (default should work)
        1. If prompted click continue
    9. Choose Timezone
    10. Put in username (computer name=hostname) and password
    11.  Start installation
    12. when prompted remove installation drive and hit Enter
    13. Decrypt Drive and log in
    14.  When the Welcome Program opens 
        1. Click skip
        2. Click Next
        3. select No, dont send system info and select next
        4. Leave location services off and select next
        5. Click Done
    15. Open terminal
        1. Run $sudo apt-get install git -y
        2. git clone https://www.github.com/spockly/installer	
        3. cd installer
        4. ./training_install.sh
    16. Encrypt Second Hard Drive
        1. Hit windows key and type disks and hit enter
        2. Select second 512 drive that doesnt have any volumes
        3. Click Cogwheel and select format partition
        4. Enter drive name 
        5. Make it a password protected volume and select next and enter in a password
        6. Click Format
    17. Fix Wifi shutting off on sleep
        1. sudo vim /etc/default/grub
        2. in vim add this file to the end of the file (enter interactive mode to type by using I)
        3. GRUB_CMDLINE_LINUX_DEFAULT="acpi_osi=! acpi_osi='Windows 2009' quiet splash"
        4. hit escape and type :wq and press enter
        5. sudo update-grub
        6. sudo reboot
