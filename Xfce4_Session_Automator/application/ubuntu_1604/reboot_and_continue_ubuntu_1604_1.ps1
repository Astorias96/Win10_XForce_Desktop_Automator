﻿#Enable Logging & KUUIP
Start-Transcript -Path "C:\Program Files\Xfce4_Session_Automator\transcripts\1_reboot_and_continue_ubuntu_1604_ps1.txt" -IncludeInvocationHeader -Append
cls
Write-Warning '==33%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'

#Back up the default variables preferences for later use
$OriginalProgressPref = $ProgressPreference
$OriginalErrorActionPref = $ErrorActionPreference

#Change the default values on progress & error-action variables
$ProgressPreference = "SilentlyContinue"
$ErrorActionPreference = "SilentlyContinue"

#Delete and unregister the scheduled task (1)
Unregister-ScheduledTask -TaskName 1_RAC_U1604 -Confirm:$false

#KUUIP
cls
Write-Warning '==35%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'

#Import and register a scheduled task (2) (will be removed and unregistered in reboot_and_continue_ubuntu_1604_2.ps1)
Register-ScheduledTask -xml (Get-Content 'C:\Program Files\Xfce4_Session_Automator\application\ubuntu_1604\2_RAC_U1604.xml' | Out-String) -TaskName "2_RAC_U1604" -TaskPath "\Xfce4_Session_Automator\Ubuntu_1604" –Force -User $env:COMPUTERNAME\$env:USERNAME

#Install the WSL linux distrinution package, KUUIP & clear temporary file
$env:ProgramFiles
cls
Write-Warning '==37%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ubuntu_1604.appx -UseBasicParsing
Add-AppxPackage .\ubuntu_1604.appx
rm "C:\Program Files\ubuntu_1604.appx"

#Reset the default progress, warning & error preferences
$ProgressPreference = $OriginalProgressPref
$ErrorActionPreference = $OriginalErrorActionPref

#Install linux distribution, KUUIP & reboot
Write-Warning 'In the next operation Ubuntu 16.04 LTS (WSL Edition) will be installed. You will get promped to CREATE an user. Type EXIT and press Enter to continue the operations.'
Write-Warning 'If you already have an user and installed Ubuntu 16.04 LTS, type EXIT and press Enter to continue the installation.'
pause
cd 'C:\WINDOWS\system32\'
cls
Write-Warning '==46%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'
Write-Warning 'Once the installation is finished, please CREATE an user. Once completed please type EXIT and press Enter to continue the operations.'
Write-Warning 'If you already have an user and installed Ubuntu 16.04 LTS, type EXIT and press Enter to continue the installation.'
ubuntu1604.exe

#Continue Windows prerequisites installation & KUUIP
$env:ProgramFiles
cls
Write-Warning '==59%== - Ubuntu 16.04 LTS (WSL Edition) was installed on this computer.'
Write-Warning 'Be sure that Ubuntu 16.04 completed the installation before continuing. A RESTART is needed.'
Write-Warning 'The installation will continue automatically.'
Write-Warning 'Press Enter to RESTART this computer.'
pause
Restart-Computer

Stop-Transcript