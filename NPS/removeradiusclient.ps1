$RemoveRadClient = @('')
foreach $i in $RemoveRadClient {
Remove-NpsRadiusClient -Name $i
}
Get-NpsRadiusClient
