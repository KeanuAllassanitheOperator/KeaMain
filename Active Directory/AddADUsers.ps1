Add-type -AssemblyName System.Web
$userlist = @('')
$group 
foreach $i in $userlist {
  if Get-ADUser -Filter { SamAccountName -eq $SamAccountName } 
  {
      "User exists."
  }  
  else {
        $password = [System.Web.Security.Membership]::GeneratePassword(12,1)
        New-ADUser -Name $i -AccountPassword $password -SamAccountName $i -Passwordneverexpires $true -Enabled $true
        Add-ADGroupMember -Identity $group -Members $i
        Write-Host  $i + " " + $password  
      }
}
