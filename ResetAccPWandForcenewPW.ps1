$user = [ADSI]'WinNT://localhost/user';
$user.passwordExpired = 1;
$user.setinfo();
