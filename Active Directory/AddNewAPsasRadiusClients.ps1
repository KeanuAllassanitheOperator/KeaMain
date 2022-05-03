# Liste der IPS von den APs
$ap = Read-Host("Name des Access Points ")
$secret = 
do {
 $ip = Read-Host("IP-Adresse des Radius Clients ")
 $ipregex = $ipv4 = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
 if ($ip -match $ipregex) {
  New-NpsRadiusClient -Address $i -Name $a -SharedSecret $secret 
  Get-NpsRadiusClient
  break
 else {
   Write-Host ($ip isnt a valid IP Address)
 }
} while ($ip -notmatch $ipregex)   
