Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapI
$mailboxlist = @('')
$password = Read-Host "Enter password" -AsSecureString
New-Mailbox -UserPrincipalName "ruffy@keadc.local" -Database "EX2019-DB01" -Name "Monkey D Ruffy" -OrganizationalUnit "Users" -Password $password -FirstName "Monkey D" -LastName "Ruffy" -DisplayName "Monkey D Ruffy" -Alias "ruffy"
