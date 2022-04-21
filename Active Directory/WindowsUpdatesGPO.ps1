New-GPO -Name "Windows Update for all Domain Users"
Set-GPRegistryValue -Name "Windows Update for all Domain Users" -Key "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -ValueName "DetectionFrequencyEnabled" -Value 1 -Type DWord
Set-GPRegistryValue -Name "Windows Update for all Domain Users" -Key "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -ValueName "DetectionFrequency" -Value 24 -Type DWord
