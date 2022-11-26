$GpoName = "CertTrust"
$ou="dc=bktm,dc=local"
$Group=@('YubikeyAuthUsers')
New-GPO -Name $certsGpoName | new-gplink -target $ou -LinkEnabled Yes 
$certThumbprint = dir Cert:\LocalMachine\my | Select-Object -ExpandProperty Thumbprint -First 1

$certRegistryKeyPath = 'HKLM:\SOFTWARE\Microsoft\SystemCertificates\MY\Certificates\{0}' -f $certThumbprint

$certBlob = Get-ItemProperty -Path $certRegistryKeyPath -Name 'Blob' | Select -Expand 'Blob'

$certPoliciesRegistryKey = 'HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\Root\Certificates\{0}' -f $certThumbprint

$null = Set-GPRegistryValue -Name $certsGpoName -Key $certPoliciesRegistryKey -ValueName 'Blob' -Type Binary -Value $certBlob

foreach ($sgroup in $Group) {
   set-gppermissions -Name $GpoName -permissionlevel GpoApply -targetname $sgroup -targettype group
}
