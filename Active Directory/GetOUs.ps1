#Enter a path to your CSV File
$ADOUs = "C:\PSScripts\CSVDumps\currentOUs.csv"
Get-ADOrganizationalUnit -Filter 'Name -like "*"' | select Name, DistinguishedName | Export-Csv $ADOUs -NoTypeInformation -Encoding UTF8
