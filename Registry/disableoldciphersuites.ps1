(Get-Item 'HKLM:\').OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey('AES 256/256')

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256' -name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null
New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

Write-Host 'SSL 2.0 has been disabled.'

New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

Write-Host 'SSL 3.0 has been disabled.'

New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

Write-Host 'TLS 1.0 has been disabled.'

New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-Item `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' `
    -name 'Enabled' `
    -value '0' `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

New-ItemProperty `
    -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' `
    -name 'DisabledByDefault' `
    -value 1 `
    -PropertyType 'DWord' `
    -Force `
    | Out-Null

Write-Host 'TLS 1.1 has been disabled.'

(Get-Item 'HKLM:\').OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey('RC4 40/128')

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null

(Get-Item 'HKLM:\').OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey('RC4 56/128')

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null

(Get-Item 'HKLM:\').OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey('RC4 64/128')

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null

(Get-Item 'HKLM:\').OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey('RC4 128/128')

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null

