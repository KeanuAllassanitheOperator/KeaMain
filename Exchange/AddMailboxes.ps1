# Add Mailboxes from exisiting AD Users
$users = @('')
foreach ($e in $users) {
Enable-Mailbox -Identity $e
}
