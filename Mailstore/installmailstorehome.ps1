#https://www.mailstore.com/en/products/mailstore-home/
Invoke-WebRequest -OutFile "MailStoreHomeSetup-22.1.0.20583.exe" https://download.mailstore.com/dont-link-this/36B44217-2BF0-4603-8160-35DF2A708DC3/22.1.0.20583/MailStoreHomeSetup-22.1.0.20583.exe  
Start-Process "MailStoreHomeSetup-22.1.0.20583.exe" -ArgumentList "/passive" -wait -Passthru
