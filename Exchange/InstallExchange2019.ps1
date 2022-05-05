#https://docs.microsoft.com/en-us/exchange/plan-and-deploy/deploy-new-installations/unattended-installs?view=exchserver-2019 #für mehre Optionen bei dem Setup.exe Command je nach Anwendungsfall
Invoke-WebRequest -OutFile "C:\vc_redist.x64.exe" https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe 
Start-Process "C:\vc_redist.x64.exe" -ArgumentList "/passive" -wait -Passthru
del C:\vc_redist.x64.exe
#Invoke-WebRequest -OutFile "C:\UcmaRuntimeSetup.exe" https://download.microsoft.com/download/D/F/F/#DFFB3570-3264-4E01-BB9B-0EFDA4F9354F/UcmaRuntimeSetup.exe
#Start-Process "C:\UcmaRuntimeSetup.exe" -ArgumentList "/passive" -wait -Passthru
choco install ucma4
Install-WindowsFeature RSAT-ADDS
Install-WindowsFeature NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, RSAT-ADDS
Invoke-WebRequest -OutFile "C:\ExchangeServer2019-x64-CU9.ISO" https://download.microsoft.com/download/d/7/b/d7bcf78a-00d2-4a46-a3d2-7d506116bcd2/ExchangeServer2019-x64-CU9.ISO
Invoke-WebRequest -OutFile "C:\ndp48-web.exe" https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe
Start-Process "C:\ndp48-web.exe" -ArgumentList "/passive" -wait -Passthru
Mount-DiskImage -ImagePath "C:\ExchangeServer2019-x64-CU9.ISO"
E:\Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms
E:\Setup.exe /PrepareAD /OrganizationName:”KeaDC” /IAcceptExchangeServerLicenseTerms
E:\Setup.exe /PrepareAllDomains /IAcceptExchangeServerLicenseTerms
E:\setup.exe /Mode:Install /OrganizationName:”KeaDC” /IacceptexchangeServerLicenseTerms /Role:Mailbox /DBFilePath:"C:\Exchange\Data\MDB\EX2019-DB01.edb" /LogFolderPath:"C:\Exchange\Data\LOGS" /MdbName:"EX2019-DB01"
Restart-Computer

