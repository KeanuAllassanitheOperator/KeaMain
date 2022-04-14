# Dieses Skript importiert ein Win Server Zertfikat als Vertrauenswürdige Zertifikat, damit Client diesem vertrauen
$certsGpoName = 'RadiusGPO'

$certThumbprint = '69A2F2ED59000C57719A210CF728F790533BDF6E'

$certRegistryKeyPath = 'HKLM:\SOFTWARE\Microsoft\SystemCertificates\MY\Certificates\{0}' -f $certThumbprint

$certBlob = Get-ItemProperty -Path $certRegistryKeyPath -Name 'Blob' | Select -Expand 'Blob'

$certPoliciesRegistryKey = 'HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\Root\Certificates\{0}' -f $certThumbprint

$null = Set-GPRegistryValue -Name $certsGpoName -Key $certPoliciesRegistryKey -ValueName 'Blob' -Type Binary -Value $certBlob
