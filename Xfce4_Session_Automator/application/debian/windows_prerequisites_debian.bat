@echo off > NUL
ECHO ===This utility will install the Xfce4_Session_Automator Debian GNU/Linux (WSL edition) prerequisites for Windows 10=== 
ECHO ===Your computer will RESTART SEVERAL TIMES during this process - The installation will resume automatically after each restart===
ECHO ===This process will take some time - Please be patient - Do not close any windows - Some interaction of yours is needed during the setup===
ECHO ===Please consult README.txt before use - Programmed by Ludovic Lemoine===
PAUSE
cd %programfiles% && Powershell.exe -Executionpolicy  remotesigned -File  "C:\Program Files\Xfce4_Session_Automator\application\debian\windows_prerequisites_debian.ps1"
ECHO ===This utility will install the Xfce4_Session_Automator Debian GNU/Linux (WSL edition) prerequisites for Windows 10===
ECHO ===Installation ongoing...===
ECHO ON