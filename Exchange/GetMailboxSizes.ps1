Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
Get-Mailbox -Database * | Get-MailboxStatistics | Sort totalitemsize -Descending | ft DisplayName,TotalItemSize
