$ADGroup = @('')
oupath= "CN=Users,DC=keadc,DC=local"
foreach $i in $ADGroup {
   New-ADGroup -Name $i -GroupCategory Security -GroupScope Global -DisplayName $i -Path  $oupath 
}
