#Enable Logging & KUUIP
Start-Transcript -Path "C:\Program Files\Xfce4_Session_Automator\transcripts\1_reboot_and_continue_sles_12_ps1.txt" -IncludeInvocationHeader -Append
cls
Write-Warning '==33%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'

#Back up the default variables preferences for later use
$OriginalProgressPref = $ProgressPreference
$OriginalErrorActionPref = $ErrorActionPreference

#Change the default values on progress & error-action variables
$ProgressPreference = "SilentlyContinue"
$ErrorActionPreference = "SilentlyContinue"

#Delete and unregister the scheduled task (1)
Unregister-ScheduledTask -TaskName 1_RAC_SLES12 -Confirm:$false

#KUUIP
cls
Write-Warning '==35%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'

#Import and register a scheduled task (2) (will be removed and unregistered in reboot_and_continue_sles_12_2.ps1)
##Register-ScheduledTask -xml (Get-Content 'C:\Program Files\Xfce4_Session_Automator\application\sles_12\2_RAC_SLES12.xml' | Out-String) -TaskName "2_RAC_SLES12" -TaskPath "\Xfce4_Session_Automator\Sles_12" –Force -User $env:COMPUTERNAME\$env:USERNAME

#Install the WSL linux distrinution package, KUUIP & clear temporary file
$env:ProgramFiles
cls
Write-Warning '==37%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'
Invoke-WebRequest -Uri https://aka.ms/wsl-sles-12 -OutFile sles_12.appx -UseBasicParsing
Add-AppxPackage .\sles_12.appx
rm "C:\Program Files\sles_12.appx"

#Reset the default progress, warning & error preferences
$ProgressPreference = $OriginalProgressPref
$ErrorActionPreference = $OriginalErrorActionPref

#Install linux distribution, KUUIP & reboot
Write-Warning 'In the next operation SUSE Linux Enterprise Server 12 (WSL Edition) will be installed. You will get promped to CREATE an user. Type EXIT and press Enter to continue the operations.'
Write-Warning 'If you already have an user and installed SUSE Linux Enterprise Server 12, type EXIT and press Enter to continue the installation.'
pause
cd 'C:\WINDOWS\system32\'
cls
Write-Warning '==46%== - Installation ongoing... Please wait. DO NOT CLOSE THIS WINDOW. This utility is setting up the Windows 10 prerequisites.'
Write-Warning 'Once the installation is finished, please CREATE an user. Once completed please type EXIT and press Enter to continue the operations.'
Write-Warning 'If you already have an user and installed SUSE Linux Enterprise Server 12, type EXIT and press Enter to continue the installation.'
Write-Warning 'You must activate your system right after the account creation. For more information on licensing: https://www.suse.com/licensing/'
Write-Warning 'After the registration is completed, the updates can be deployed automatically.'
sles-12.exe

#Continue Windows prerequisites installation & Copy Desktop shortcut & KUUIP
cls
Write-Warning '==69%== - SUSE Linux Enterprise Server 12 (WSL Edition) was installed on this computer.'
Copy-Item -Path $env:ProgramFiles/Xfce4_Session_Automator/launchers/SUSE_Linux_Enterprise_Server_12.lnk -Destination $env:UserProfile/Desktop
Write-Warning '==87%== - Desktop shortcut to CLI sucessfully created.'
cls
Write-Warning '==100%== - The installation is finished! There is no software/theme customisation included for SUSE Linux Enterprise Server 12.'
Write-Warning 'For more information about the system requirements and the deployed software, please visit the README file:'
Write-Warning 'C:/Program Files/Xfce4-Session-Automator/README.txt'
Write-Warning 'If ou decide to install Xfce4 User interface, you can use this launcher to start a session:'
Write-Warning 'C:\Program Files\Xfce4_Session_Automator\launchers\SUSE_Linux_Enterprise_Server_12_GUI.lnk'
Write-Warning 'A restart is needed before the OS can be used correctly.'
Write-Warning 'Designed for SUSE Linux Enterprise Server 12 WSL edition - Do not CLOSE this window - Programmed by Ludovic Lemoine'
Write-Warning 'Press Enter to RESTART this computer.'
pause
Restart-Computer

Stop-Transcript