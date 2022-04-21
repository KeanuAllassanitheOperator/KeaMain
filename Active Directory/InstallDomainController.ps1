Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
# Installiere Chrome
$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
Rename-Computer -NewName "KeaDC"
$validdomain = Read-Host "Please enter a domain name"
# Powershell meckert, dass der DNS NAme nicht vorhanden ist, wenn dieser nicht aufgelöst werden kann
Resolve-DnsName -Name $validdomain
# Deinstalliere Internet Explorer
Disable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 -Online
Add-WindowsFeature AD-Domain-Services
Add-WindowsFeature ADRMS 
Add-WindowsFeature  ADLDS 
Add-WindowsFeature  ADFS-Federation
Add-WindowsFeature RSAT-ADDS
Add-WindowsFeature RSAT-AD-AdminCenter
Add-WindowsFeature   RSAT-ADDS-Tools
Add-WindowsFeature    RSAT-ADLDS
Install-ADDSDomainController -DomainName "keadc.local" -DelegatedAdministratorAccountName "Keanu" -DatabasePath "C:\Windows\NTDS"  -InstallDNS:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SYSVOLPath "C:\Windows\SYSVOL"-Force:$true -SafeModeAdministratorPassword $(convertto-securestring -string "" -asplaintext -force)
Install-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Install-ADcsCertificationAuthority -CAType "StandaloneRootCA" –CACommonName “KeaDCCertActual” –CADistinguishedNameSuffix “DC=keadc,DC=local” –CryptoProviderName “RSA#Microsoft Software Key Storage Provider” -KeyLength 4096 –HashAlgorithmName SHA1 –ValidityPeriod Years –ValidityPeriodUnits 10 –DatabaseDirectory “C:\windows\system32\certLog” –LogDirectory “c:\windows\system32\CertLog” –Force
#Restart-Computer
