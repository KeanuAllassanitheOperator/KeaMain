$dir="C:\GpoBackup"
$domain="bktm.local"
$target="dc=bktm, dc=local"
Restore-GPO -All -Domain $domain -Path $dir
Get-GPO -All -Domain $domain | New-GPLink - Target $target
