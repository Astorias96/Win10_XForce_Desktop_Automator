#Enable Logging
Start-Transcript -Path "C:\Program Files\Xfce4_Session_Automator\transcripts\windows_prerequisites_ubuntu2004_ps1.txt" -IncludeInvocationHeader -Append
cls

#Back up the default variables preferences for later use
$OriginalProgressPref = $ProgressPreference
$OriginalErrorActionPref = $ErrorActionPreference

#Change the default values on progress & error-action variables
$ProgressPreference = "SilentlyContinue"
$ErrorActionPreference = "SilentlyContinue"

#KUUIP - Keep the User Updated on the Installation Progress
cls
Write-Warning '==0%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'

#Import and register a scheduled task (1) (will be removed and unregistered in reboot_and_continue_ubuntu_2004_1.ps1)
Register-ScheduledTask -xml (Get-Content 'C:\Program Files\Xfce4_Session_Automator\application\ubuntu_2004\1_RAC_U2004.xml' | Out-String) -TaskName "1_RAC_U2004" -TaskPath "\Xfce4_Session_Automator\Ubuntu_2004" –Force -User $env:COMPUTERNAME\$env:USERNAME

#Silently install Vcxsrv-64.1.20.1.4.installer.exe
& 'C:\Program Files\Xfce4_Session_Automator\ressources\windows_prerequisites\vcxsrv-64.1.20.1.4.installer.exe' /S

#KUUIP
cls
Write-Warning '==24%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'

#Enable WSL feature
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -n

#Reset the default progress, warning & error preferences
$ProgressPreference = $OriginalProgressPref
$ErrorActionPreference = $OriginalErrorActionPref

#Rebooting & KUUIP
cls
Write-Warning 'The Windows Subsystem for Linux has been installed. A RESTART is needed.'
Write-Warning 'The installation will continue automatically.'
Write-Warning 'Press Enter to RESTART this computer.'
pause
Restart-Computer

Stop-Transcript