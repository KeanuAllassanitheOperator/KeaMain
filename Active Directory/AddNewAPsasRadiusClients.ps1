# Liste der IPS von den APs
$ap = Read-Host("Name des Access Points")
$secret = 
$ip = Read-Host("IP-Adresse des Radius Clients")
New-NpsRadiusClient -Address $i -Name $a -SharedSecret $secret
Get-NpsRadiusClient
