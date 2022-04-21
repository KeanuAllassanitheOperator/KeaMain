# Liste der IPS von den APs
$listeap = @('')
$secret = 
$listeip = @('')
foreach ($a in $listeap) {
 foreach ($i in $listeip) {
New-NpsRadiusClient -Address $i -Name $a -SharedSecret $secret
 }
}
