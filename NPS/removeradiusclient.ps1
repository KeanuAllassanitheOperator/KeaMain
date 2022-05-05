$RemoveRadClient = @('')
foreach $i in $RemoveRadClient {
Remove-NpsRadiusClient -Namei
}
Get-NpsRadiusClient
