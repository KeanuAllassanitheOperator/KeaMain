$domainuser = Read-Host -Prompt 'Enter a user, who will become a DomainAdmin' 
$pw = Read-Host -Prompt 'Enter a Password for this user' -AsSecureString 
New-ADUser -Name $domainuser -AccountPassword $pw -Passwordneverexpires $true -Enabled $true
Add-ADGroupMember -Identity "Domänen-Admins" -Members $domainuser
# Schreibzugriff auf C Volume klappt nicht
$acl = Get-Acl C:

$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("KEADC0\Keanu","FullControl","Allow")

$acl.SetAccessRule($AccessRule)

$acl | Set-Acl C: