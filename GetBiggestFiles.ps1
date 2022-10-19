Get-ChildItem D:\ -r|sort -descending -property length | select -first 10 name, DirectoryName, @{Name="GB";Expression={[Math]::round($_.length / 1GB, 2)}} | Out-GridView
