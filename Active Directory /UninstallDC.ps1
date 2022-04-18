Remove-WindowsFeature ADRMS 
Remove-WindowsFeature  ADLDS 
Remove-WindowsFeature  ADFS-Federation
Remove-WindowsFeature RSAT-ADDS
Remove-WindowsFeature RSAT-AD-AdminCenter
Remove-WindowsFeature   RSAT-ADDS-Tools
Remove-WindowsFeature    RSAT-ADLDS
Remove-Item  -Path cert:\LocalMachine\My\FE387EA22C4A2A61E276A526C177ADE382104A92 -DeleteKey
Uninstall-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Uninstall-ADDSDomainController -LastDomainControllerInDomain -LocalAdministratorPassword (ConvertTo-SecureString -AsPlainText "passwordfromyou" -Force) -RemoveApplicationPartitions
Remove-WindowsFeature AD-Domain-Services
