$RemoveRadClient = Read-Host("Welchen RadiusClient wollen Sie entfernen? ")
Remove-NpsRadiusClient -Name $RemoveRadClient
Get-NpsRadiusClient
