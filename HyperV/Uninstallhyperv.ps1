Uninstall-WindowsFeature -Name Hyper-V -IncludeManagementTools
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Restart-Computer
