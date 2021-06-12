@echo off > NUL && cls
ECHO WARNING: This script will help WSL users to install the required packages to the automation of the Xforce4 session-start and screen export process - Theme customisation is also included - For more information about the system requirements and the deployed software, please visit the C:/Program Files/Xfce4-Session-Automator/README.txt file - Designed for Debian GNU/Linux WSL edition - During the next operation the system will request your root password several times - Accept restarting services during upgrade when prompted - Please be patient as this operation will take some time - Do not CLOSE this window - Programmed by Ludovic Lemoine
ECHO WARNING: Your system will be updated and the following software will be installed: xfce4, neofetch, firefox-esr, numix-gtk-theme, fonts-roboto, fonts-noto, papirus-icon-theme
PAUSE
ECHO ==The installation is ongoing. Please do not close this window.== && ECHO ON && debian.exe run "cd $HOME ; sudo cp /mnt/c/'Program Files'/Xfce4_Session_Automator/ressources/software_prerequisites/icon-theme/papirus-icon-theme_20190203-1~bpo9+1_all.deb $HOME ; sudo chmod +x $HOME/papirus-icon-theme_20190203-1~bpo9+1_all.deb ; sudo apt-get update && sudo apt-get upgrade -y ; sudo apt-get install software-properties-common -y ; sudo apt-get install dirmngr --install-recommends ; sudo apt-get install xfce4 -y ; sudo apt-get install neofetch -y ; sudo apt-get install firefox-esr -y ; sudo apt-get install numix-gtk-theme -y ; sudo apt-get install fonts-roboto -y ; sudo apt install fonts-noto -y ; cd $HOME ; sudo dpkg -i './papirus-icon-theme_20190203-1~bpo9+1_all.deb' ; sudo apt purge xscreensaver -y ; sudo apt-get update && sudo apt-get upgrade -y ; sudo apt-get install -f -y ; sudo apt autoremove -y ; sudo dpkg --configure -a"
ECHO OFF
cd %Programfiles%\Xfce4_Session_Automator\launchers\ && copy debian.lnk %userprofile%\Desktop /y
ECHO WARNING: Desktop shortcut sucessfully created.
debian.exe run "cd $HOME ; sudo cp /mnt/c/'Program Files'/Xfce4_Session_Automator/application/debian/xfce4_automatic_theme_apply_debian.sh $HOME ; sudo chmod +x $HOME/xfce4_automatic_theme_apply_debian.sh" && ECHO ON
ECHO OFF
ECHO WARNING: The Theme-applier file was successfully copied to the subsystem desktop.
ECHO WARNING: A new xfce4-session window will open after you press Enter.
ECHO WARNING: In this window, please  enter 'cd $HOME ; sudo ./xfce4_automatic_theme_apply_debian.sh' in a TERMINAL (copy and paste) to apply all theme settings automatically.
ECHO WARNING: Please LOGOUT your xfce4-session after the theme-applier script ran. If the themes weren't applied correctly, re-run the script.
PAUSE
"C:\PROGRA~1\Xfce4_Session_Automator\launchers\debian.lnk"
ECHO WARNING: The installation has succeeded. By pressing Enter this computer will RESTART. After the computer restarted you can use the automation software !
PAUSE
shutdown /r
ECHO ON