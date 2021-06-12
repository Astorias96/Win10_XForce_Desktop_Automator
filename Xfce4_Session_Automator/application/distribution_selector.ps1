#Enable Logging and disable user output

Start-Transcript -Path "C:\Program Files\Xfce4_Session_Automator\transcripts\distribution_selector_ps1.txt" -IncludeInvocationHeader -Append
cls


#Hide Powershell Window and declare variables

PowerShell.exe -WindowStyle Hidden { }
$Data1 = 'Ubuntu 20.04 LTS'
$Data2 = 'Ubuntu 18.04 LTS'
$Data3 = 'Ubuntu 16.04 LTS'
$Data4 = 'Debian GNU/Linux'
$Data5 = 'SUSE Linux Entreprise Server 12'
$Data6 = 'Kali Linux'
$Data7 = 'Fedora Remix'


#Creating objects for the menu

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Setup - WSL distribution selector'
$form.Size = New-Object System.Drawing.Size(360,220)
$form.StartPosition = 'CenterScreen'
$objIcon = New-Object system.drawing.icon ("C:\Program Files\Xfce4_Session_Automator\ressources\svg_launchers\linux_penguin.ico")
$form.Icon = $objIcon

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(13,111)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'Confirm'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(257,111)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Abort'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$ReadMeButton = New-Object System.Windows.Forms.Button
$ReadMeButton.Location = New-Object System.Drawing.Size(137,111)
$ReadMeButton.Size = New-Object System.Drawing.Size(75,23)
$ReadMeButton.Text = "Read-Me"
$form.Controls.Add($ReadMeButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please select a Linux distribution for installation:'

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,145)
$label2.Size = New-Object System.Drawing.Size(335,27)
$label2.TextAlign = ContentAlignment.MiddleCenter
$label2.Text = 'Ensure no other Linux WSL distribution is installed on this system before continuing.'

$listBox = New-Object System.Windows.Forms.Listbox
$listBox.Location = New-Object System.Drawing.Point(10,32)
$listBox.Size = New-Object System.Drawing.Size(322,80)
$listBox.Height = 70
$listBox.Width = 325
$listBox.SelectionMode = 'One'

[void] $listBox.Items.Add($Data1)
[void] $listBox.Items.Add($Data2)
[void] $listBox.Items.Add($Data3)
[void] $listBox.Items.Add($Data4)
[void] $listBox.Items.Add($Data5)
[void] $listBox.Items.Add($Data6)
[void] $listBox.Items.Add($Data7)


#Adding components to the form

$form.Controls.Add($listBox)
$form.Controls.Add($label)
$form.Controls.Add($label2)
$form.Topmost = $true
$listBox.SelectedItem = $Data1

#Add ReadMe Button event

$ReadMeButton.Add_Click(                                  {
        cd $Env:ProgramFiles\Xfce4_Session_Automator\
        ./README.txt
    })

#Creating conditions based on user input

$result = $form.ShowDialog()


if ($result -eq [System.Windows.Forms.DialogResult]::OK)  {

    $x = $listBox.SelectedItems

    if ($listBox.SelectedItems  -eq $Data1)               {
        $Env:ProgramFiles
        cd .\Xfce4_Session_Automator\application\ubuntu_2004\
        Start-Process .\windows_prerequisites_ubuntu_2004.bat

    }  ElseIf ($listBox.SelectedItems  -eq $Data2)        {
        $Env:ProgramFiles
        cd .\Xfce4_Session_Automator\application\ubuntu_1804\
        Start-Process .\windows_prerequisites_ubuntu_1804.bat

    }  ElseIf ($listBox.SelectedItems  -eq $Data3)        {
        $Env:ProgramFiles
        cd .\Xfce4_Session_Automator\application\ubuntu_1604\
        Start-Process .\windows_prerequisites_ubuntu_1604.bat

    }  ElseIf ($listBox.SelectedItems  -eq $Data4)        {
        $Env:ProgramFiles
        cd .\Xfce4_Session_Automator\application\debian\
        Start-Process .\windows_prerequisites_debian.bat

    }  ElseIf ($listBox.SelectedItems  -eq $Data5)        {
        $Env:ProgramFiles
        cd .\Xfce4_Session_Automator\application\sles_12\
        Start-Process .\windows_prerequisites_sles_12.bat
            
    }  ElseIf ($listBox.SelectedItems  -eq $Data6)        {
         Add-Type -Assembly 'System.Windows.Forms'
         [Windows.Forms.MessageBox]::Show(“Sorry, this distibution is still under ongoing development..”, "  Information", [Windows.Forms.MessageBoxButtons]::OK, [Windows.Forms.MessageBoxIcon]::Information)
         $Env:ProgramFiles
         cd .\Xfce4_Session_Automator\application\
            .\distribution_selector.bat 

    }  ElseIf ($listBox.SelectedItems  -eq $Data7)        {
         Add-Type -Assembly 'System.Windows.Forms'
         [Windows.Forms.MessageBox]::Show(“Sorry, this distibution is still under ongoing development..”, "  Information", [Windows.Forms.MessageBoxButtons]::OK, [Windows.Forms.MessageBoxIcon]::Information)
         $Env:ProgramFiles
         cd .\Xfce4_Session_Automator\application\
            .\distribution_selector.bat                   
    }
}


Stop-Transcript