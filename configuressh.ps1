 Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
 Set-Service -Name sshd -StartupType ‘Automatic’
Start-Service -name sshd
