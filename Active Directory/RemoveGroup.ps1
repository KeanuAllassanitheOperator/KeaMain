$Group = Read-Host("Welche AD Gruppe wollen Sie löschen? ")
Remove-ADGroup -Identity $Group

