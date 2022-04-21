#Listenobjekt oder Date für mehrere
$liste = @('')
foreach ($i in $liste) {
New-ADGroup -Name $i -SamAccountName $i -GroupCategory Security -GroupScope Global -DisplayName $i -Path "CN=Users,DC=keadc,DC=local" -Description ""
}