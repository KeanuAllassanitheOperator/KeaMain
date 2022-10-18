$vgs = @('')
$Type = "Security" # Als Typ Sicherheitsgruppe oder Verteilergruppe 
foreach ($vg in $vgs) {
 New-DistributionGroup -Name $vg -Type $Type
}
