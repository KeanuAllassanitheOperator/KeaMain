$users = @('')
foreach ($e in $users) {
Remove-Mailbox -Identity $e
}
