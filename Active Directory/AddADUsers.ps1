#Listenobjekt oder Datei
Add-type -AssemblyName System.Web

$liste = @('Javier', 'Ingrid' 'Holger')

foreach ($i in $liste) { 
$password = [System.Web.Security.Membership]::GeneratePassword(12,1)
New-ADUser -Name $i -AccountPassword $password -Passwordneverexpires $true -Enabled $true
Add-ADGroupMember -Identity "Domänen-Admins" -Members $domainuser
Write-Host  $i + " " + $password  
}
