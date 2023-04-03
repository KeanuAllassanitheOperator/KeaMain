Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
$user = ""
$vgs = @()
foreach ($vg in $vgs) {

    Remove-DistributionGroupMember -Identity $vg -Member "$user"
}
