Add-type -AssemblyName System.Web
$Username = Read-Host("Neuer Benutzer: ") 
$Group = Read-Host("Welche Gruppe? ")
$password = [System.Web.Security.Membership]::GeneratePassword(12,1)
New-ADUser -Name $Username -AccountPassword $password -Passwordneverexpires $true -Enabled $true
Add-ADGroupMember -Identity $Group -Members $Username
Write-Host  $Username + " " + $password  

