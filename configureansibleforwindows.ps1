Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 
Set-Service -Name sshd -StartupType ‘Automatic’ 
Start-Service ssh
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
