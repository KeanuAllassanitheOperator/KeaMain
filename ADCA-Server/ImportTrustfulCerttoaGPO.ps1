# Dieses Skript importiert ein Win Server Zertfikat als Vertrauenswürdige Zertifikat, damit Client diesem vertrauen
#  Mit dir Cert:\LocalMachine\my kann man seine aktuellen Zertifikate sehen
$certsGpoName = 'Name of GPO'

$certThumbprint = 'Thumbprint des Certs'

$certRegistryKeyPath = 'HKLM:\SOFTWARE\Microsoft\SystemCertificates\MY\Certificates\{0}' -f $certThumbprint

$certBlob = Get-ItemProperty -Path $certRegistryKeyPath -Name 'Blob' | Select -Expand 'Blob'

$certPoliciesRegistryKey = 'HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\Root\Certificates\{0}' -f $certThumbprint

$null = Set-GPRegistryValue -Name $certsGpoName -Key $certPoliciesRegistryKey -ValueName 'Blob' -Type Binary -Value $certBlob
