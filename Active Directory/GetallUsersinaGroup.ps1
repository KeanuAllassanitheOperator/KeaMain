#Enter a path to your CSV File
$group = ""
$ADGroups = "C:\PSScripts\CSVDumps\$group.csv"
# Filter muss angepasst werden je nach dem was man suchen will
Get-ADGroupMember -Identity $group -Filter * -Properties * | Select Name | Export-Csv $ADGroups -NoTypeInformation -Encoding UTF8

