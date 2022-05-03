# Liste der IPS von den APs
$ap = Read-Host ("Name des Access Points")
$secret = 
New-NpsRadiusClient -Address $i -Name $a -SharedSecret $secret
Get-NpsRadiusClient
