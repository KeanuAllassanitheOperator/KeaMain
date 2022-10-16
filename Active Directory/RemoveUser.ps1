$User = @('')
# Nach deaktivierten Konten filtern und löschen
#Search-ADAccount -AccountDisabled | where {$_.ObjectClass -eq 'user'} | Remove-ADUser
foreach $i in $User{ 
Remove-ADUser -Identity $i
} 


