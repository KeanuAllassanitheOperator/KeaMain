Add-Type -AssemblyName System.Web
$liste = @('')
foreach ($i in $liste) {
$password = [System.Web.Security.Membership]::GeneratePassword(10,1)
Set-ADAccountPassword -Identity $i -Reset -NewPassword $password
Write-Host  $i + " " $password + " Password was resetted for Account " + $i 
}
