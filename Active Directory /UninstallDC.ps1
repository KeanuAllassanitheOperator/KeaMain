Remove-WindowsFeature AD-Domain-Services
Remove-WindowsFeature ADRMS 
Remove-WindowsFeature  ADLDS 
Remove-WindowsFeature  ADFS-Federation
Remove-Windows-Feature RSAT-ADDS
Remove-Windows-Feature RSAT-AD-AdminCenter
Remove-Windows-Feature   RSAT-ADDS-Tools
Remove-WindowsFeature    RSAT-ADLDS
Uninstall-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Restart-Computer
