 Get-EventLog -LogName System -Newest 150 | Where-Object{($_.EntryType -eq "Error") -or ($_.EntryType -eq "Warning")}
