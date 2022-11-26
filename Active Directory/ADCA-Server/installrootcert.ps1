#https://learn.microsoft.com/en-us/powershell/module/adcsdeployment/install-adcscertificationauthority?view=windowsserver2022-ps
$CAType="StandaloneRootCA" 
$CAName=""
$CADistinguishedNameSuffix=DC=,DC=”
$CryptoProviderName=“RSA#Microsoft Software Key Storage Provider”
$KeyLength=4096
$HashAlgorithmName=SHA1
$ValidityPeriod=Years
$ValidityPeriod=10
$DBDir=“C:\windows\system32\certLog”
$LogDir=“c:\windows\system32\CertLog”

Install-ADcsCertificationAuthority -CAType $CAType –CACommonName $CAName –CADistinguishedNameSuffix $CADistinguishedNameSuffix –CryptoProviderName $CryptoProviderName -KeyLength $KeyLength –HashAlgorithmName $HashAlgorithmName –ValidityPeriod $ValidityPeriod –ValidityPeriodUnits $ValidityPeriod –DatabaseDirectory $DBDir –LogDirectory $LogDir –Force
  

