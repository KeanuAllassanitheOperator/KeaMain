Add-type -AssemblyName System.Web
$Username = Read-Host("Legen Sie einen neuen Benutzer an: ") 
$Group = Read-Host("Zu welcher Gruppe soll der Benutzer zugewiesen werden ? ")
$password = [System.Web.Security.Membership]::GeneratePassword(12,1)
New-ADUser -Name $Username -AccountPassword $password -Passwordneverexpires $true -Enabled $true
Add-ADGroupMember -Identity $Group -Members $Username
Write-Host  $Username + " " + $password  

