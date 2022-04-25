Get-Service | ?{$_.Name -ilike “MSexch*”} | Stop-Service -Force
Get-Service | ?{$_.Name -ilike “MSexch*”} | Set-Service -StartupType Disabled -Force