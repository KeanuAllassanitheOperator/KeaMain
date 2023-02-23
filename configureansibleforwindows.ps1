Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 
Start-Service sshd
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
$App = 5A894077.McAfeeSecurity
$PackageFullName = (Get-AppxPackage $App).PackageFullName
$ProPackageFullName = (Get-AppxProvisionedPackage -online | where {$_.Displayname -eq $App}).PackageName
if ($PackageFullName){
    Write-Output "Removing Package: $App"
    try {
            remove-AppxPackage -package $PackageFullName -ErrorAction Stop | Out-Null
        } 
    catch {
            Write-Output "ERROR: $_"
        }
        
    }
