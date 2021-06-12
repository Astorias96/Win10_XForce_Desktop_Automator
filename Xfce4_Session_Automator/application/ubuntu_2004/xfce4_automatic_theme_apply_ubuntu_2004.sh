#!/bin/bash
echo WARNING: This script will apply the pre-installed themes to this subsystem. After this operation, you should LOGOUT your system.
echo WARNING: By pressing Enter the theme will be applied. Please LOGOUT your session afterwards to APPLY the changes.
read -p "Press Enter to continue..."
xfconf-query -c xsettings -p /Net/ThemeName -s "Adapta-Nokto" ; xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus" ; xfconf-query -c xfwm4 -p /general/theme -s Adapta-Nokto ; xfconf-query -c xsettings -p /Gtk/FontName -s "Roboto Regular 12" ; xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "Roboto Regular 10" ; exit

