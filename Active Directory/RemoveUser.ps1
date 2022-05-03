$User = Read-Host("Welchen User wollen Sie löschen? ")
Remove-ADUser -Identity $User 

