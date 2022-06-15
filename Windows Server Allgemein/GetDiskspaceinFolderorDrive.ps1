 "{0} GB" -f ((Get-ChildItem 'C:\ -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1GB)
