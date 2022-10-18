$vgs = @('')
$Type = "" # Als Typ Sicherheitsgruppe oder Verteilergruppe 
foreach ($vg in $vgs) {
   $ExGroup = Get-DistributionGroup -Identity $vg 
 if (-not $ExGroup)  {
 New-DistributionGroup -Name $vg 
 #-Type $Type
     
 }
 else {
 Write-Host "VG existiert bereit schon"
 }
}
