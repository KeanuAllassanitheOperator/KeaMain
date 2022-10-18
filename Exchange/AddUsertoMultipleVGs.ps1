$user = @('')
$vgs = @("")
foreach ($vg in $vgs) {
if  (Get-DistributionGroupMember -Identity $vgname | Where {$_.Name -eq $u}) {
       Write-Host "User existiert in Verteilergruppe"
 }
 else {
    Add-DistributionGroupMember -Identity $vgname -Member $u
 }
}
