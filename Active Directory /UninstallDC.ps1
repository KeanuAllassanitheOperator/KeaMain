# DomainController Deinstllation klappt nicht :(
Remove-WindowsFeature ADRMS 
Remove-WindowsFeature  ADLDS 
Remove-WindowsFeature  ADFS-Federation
Remove-WindowsFeature RSAT-ADDS
Remove-WindowsFeature RSAT-AD-AdminCenter
Remove-WindowsFeature   RSAT-ADDS-Tools
Remove-WindowsFeature    RSAT-ADLDS
Remove-Item  -Path cert:\LocalMachine\My\Thumbprint from your certificate -DeleteKey
Uninstall-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Uninstall-ADDSDomainController -LastDomainControllerInDomain -LocalAdministratorPassword (ConvertTo-SecureString -AsPlainText "passwordfromyou" -Force) -RemoveApplicationPartitions
Uninstall-WindowsFeature AD-Domain-Services
