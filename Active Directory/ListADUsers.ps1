#Enter a path to your CSV File
$ADUsers = "C:\PSScripts\CSVDumps\currentusers.csv"
# Filter muss angepasst werden je nach dem was man suchen will
Get-ADUser -Filter * -Properties * | Select Name, DisplayName, SamAccountName, UserPrincipalName | Export-Csv $ADUsers -NoTypeInformation -Encoding UTF8
