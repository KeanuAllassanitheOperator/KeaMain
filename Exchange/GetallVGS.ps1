Get-DistributionGroup | select Name,DisplayName,PrimarySmtpAddress | Export-CSV "C:\PSScripts\Dumps\VGS.csv" -NoTypeInformation -Encoding UTF8
