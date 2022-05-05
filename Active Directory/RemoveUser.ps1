$User = @('')
foreach $i in $User{ 
Remove-ADUser -Identity $i
} 


