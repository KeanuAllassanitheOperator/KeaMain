Set-ExecutionPolicy Bypass -Scope Process -Force; ` iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install ntop
choco install nano
choco install vim
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0 
Set-Service -Name sshd -StartupType ‘Automatic’ 
Start-Service ssh
w32tm /config /manualpeerlist:"0.de.pool.ntp.org 1.de.pool.ntp.org 2.de.pool.ntp.org" /syncfromflags:manual /reliable:yes /update
Get-NetFirewallProfile 
