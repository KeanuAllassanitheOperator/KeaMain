$dir="C:\GpoBackup"
$domain="bktm.local"
Restore-GPO -All -Domain $domain -Path $dir
