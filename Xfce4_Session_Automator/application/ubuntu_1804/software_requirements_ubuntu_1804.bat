@echo off > NUL && cls
ECHO WARNING: This script will help WSL users to install the required packages to the automation of the Xforce4 session-start and screen export process - Theme customisation is also included - For more information about the system requirements and the deployed software, please visit the C:/Program Files/Xfce4-Session-Automator/README.txt file - Designed for Ubuntu 18.04 WSL edition - During the next operation the system will request your root password several times - Accept restarting services during upgrade when prompted - Please be patient as this operation will take some time - Do not CLOSE this window - Programmed by Ludovic Lemoine
ECHO WARNING: Your system will be updated and the following software will be installed: xfce4, neofetch, firefox, adapta-gtk-theme, fonts-roboto, fonts-noto, tilix, papirus-icon-theme
PAUSE
ECHO ==The installation is ongoing. Please do not close this window.== && ECHO ON && ubuntu1804.exe -c "sudo add-apt-repository -y ppa:tista/adapta ; sudo apt-get update && sudo apt-get upgrade -y ; sudo apt-get install xfce4 -y ; sudo apt-get install neofetch -y ; sudo apt-get install firefox -y ; sudo apt-get install adapta-gtk-theme -y ; sudo apt-get install fonts-roboto -y ; sudo apt install fonts-noto -y ; sudo apt install tilix -y ; sudo wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sh ; sudo apt purge xscreensaver -y ; sudo apt-get update && sudo apt-get upgrade -y ; sudo apt-get install -f -y ; sudo apt autoremove -y ; sudo dpkg --configure -a"
ECHO OFF
cd %Programfiles%\Xfce4_Session_Automator\launchers\ && copy ubuntu_1804.lnk %userprofile%\Desktop /y
ECHO WARNING: Desktop shortcut sucessfully created.
ubuntu1804.exe -c "cd $HOME ; sudo cp /mnt/c/'Program Files'/Xfce4_Session_Automator/application/ubuntu_1804/xfce4_automatic_theme_apply_ubuntu_1804.sh $HOME ; sudo chmod +x $HOME/xfce4_automatic_theme_apply_ubuntu_1804.sh" && ECHO ON
ECHO OFF
ECHO WARNING: The Theme-applier file was successfully copied to the subsystem desktop.
ECHO WARNING: A new xfce4-session window will open after you press Enter.
ECHO WARNING: In this window, please  enter 'cd $HOME ; sudo ./xfce4_automatic_theme_apply_ubuntu_1804.sh' in a TERMINAL (copy and paste) to apply all theme settings automatically.
ECHO WARNING: Please LOGOUT your xfce4-session after the theme-applier script ran. If the themes weren't applied correctly, re-run the script.
PAUSE
"C:\PROGRA~1\Xfce4_Session_Automator\launchers\ubuntu_1804.lnk"
ECHO WARNING: The installation has succeeded. By pressing Enter this computer will RESTART. After the computer restarted you can use the automation software !
PAUSE
shutdown /r
ECHO ON