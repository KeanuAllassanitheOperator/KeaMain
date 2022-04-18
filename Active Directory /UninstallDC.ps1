Remove-WindowsFeature AD-Domain-Services
Remove-WindowsFeature ADRMS 
Remove-WindowsFeature  ADLDS 
Remove-WindowsFeature  ADFS-Federation
Uninstall-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Restart-Computer
