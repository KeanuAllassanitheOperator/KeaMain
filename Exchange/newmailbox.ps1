Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapI
Add-Type -AssemblyName System.Web
$password = [System.Web.Security.Membership]::GeneratePassword(10,1)
$mailboxlist = @('')
New-Mailbox -UserPrincipalName "ruffy@keadc.local" -Database "EX2019-DB01" -Name "Monkey D Ruffy" -OrganizationalUnit "Users" -Password $password -FirstName "Monkey D" -LastName "Ruffy" -DisplayName "Monkey D Ruffy" -Alias "ruffy"
