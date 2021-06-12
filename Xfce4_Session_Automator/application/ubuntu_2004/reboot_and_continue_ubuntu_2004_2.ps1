#Enable Logging
Start-Transcript -Path "C:\Program Files\Xfce4_Session_Automator\transcripts\1_reboot_and_continue_ubuntu_2004_ps1.txt" -IncludeInvocationHeader -Append
cls

#Back up the default variables preferences for later use
$OriginalProgressPref = $ProgressPreference
$OriginalErrorActionPref = $ErrorActionPreference

#Change the default values on progress & error-action variables
$ProgressPreference = "SilentlyContinue"
$ErrorActionPreference = "SilentlyContinue"

#KUUIP
cls
Write-Warning '==73%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'

#Delete and unregister the scheduled task (2)
Unregister-ScheduledTask -TaskName 2_RAC_U2004 -Confirm:$false

#Execute linux distribution prerequisites & KUIP
$env:ProgramFiles
cls
Write-Warning '==100%== - The Windows 10 prerequisites were sucessfully installed. By pressing Enter another window will pop-up and guide you through the Ubuntu 20.04 software requirements setup.'
pause
Start-Process 'C:\Program Files\Xfce4_Session_Automator\application\ubuntu_2004\software_requirements_ubuntu_2004.bat'

#Reset the default progress, warning & error preferences
$ProgressPreference = $OriginalProgressPref
$ErrorActionPreference = $OriginalErrorActionPref

Stop-Transcript