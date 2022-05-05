# Liste der IPS von den APs
$ap = @('')
$ip  @('')
$secret = 
  foreach $i in $ap { 
   foreach $i $ip {
  New-NpsRadiusClient -Address $ip -Name $ap -SharedSecret $secret 
    }
  }
Get-NpsRadiusClient
 
