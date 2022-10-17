OUs = @('')
domain = "DC="", DC="""
foreach $ou in $OUs { 
 New-ADOrganizationalUnit -Name $ou -Path $domain
}
