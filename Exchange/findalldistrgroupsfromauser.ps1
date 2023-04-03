Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
$Username = 
$DistributionGroups= Get-DistributionGroup | where { (Get-DistributionGroupMember $_.Name |  foreach {$_.PrimarySmtpAddress}) -contains "$Username"} | ft Name
echo $DistributionGroups
