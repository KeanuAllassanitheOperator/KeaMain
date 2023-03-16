Get-ADUser -Filter * -Properties LastLogonDate | Where-Object {$_.LastLogonDate -lt (Get-Date).AddDays(-30)} | Sort-Object -Property LastLogonDate | select Name,LastLogonDate
