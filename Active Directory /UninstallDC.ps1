Remove-WindowsFeature AD-Domain-Services
Remove-WindowsFeature ADRMS 
Remove-WindowsFeature  ADLDS 
Remove-WindowsFeature  ADFS-Federation
Remove-WindowsFeature RSAT-ADDS
Remove-WindowsFeature RSAT-AD-AdminCenter
Remove-WindowsFeature   RSAT-ADDS-Tools
Remove-WindowsFeature    RSAT-ADLDS
Uninstall-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Uninstall-ADDSDomainController -LastDomainControllerInDomain -LocalAdministratorPassword (ConvertTo-SecureString -AsPlainText "YourAdminPassword" -Force) -RemoveApplicationPartitions
Restart-Computer
