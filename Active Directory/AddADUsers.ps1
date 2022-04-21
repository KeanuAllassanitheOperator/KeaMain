#Listenobjekt oder Datei#
$liste = @('')
foreach ($i in $liste) { 
New-ADUser -Name $i -AccountPassword $pw -Passwordneverexpires $true -Enabled $true
Add-ADGroupMember -Identity "Domänen-Admins" -Members $domainuser
}