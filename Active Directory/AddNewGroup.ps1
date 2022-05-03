$ADGroup = Read-Host ("Name der neuen AD-Gruppe: ")
New-ADGroup -Name $ADGroup -SamAccountName $ADGroup -GroupCategory Security -GroupScope Global -DisplayName $ADGroup -Path "CN=Users,DC=keadc,DC=local" -Description ""
