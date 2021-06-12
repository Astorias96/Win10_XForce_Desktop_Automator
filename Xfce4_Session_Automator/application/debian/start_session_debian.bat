@echo off > NUL
cd %ProgramFiles%
cd .\Xfce4_Session_Automator\application
start XLaunch.lnk
debian.exe run "if [ -z \"$(pidof xfce4-session)\" ]; then export DISPLAY=:0.0; xfce4-session; pkill '(gpg|ssh)-agent'; taskkill.exe /IM vcxsrv.exe; fi;"