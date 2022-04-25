#https://www.windowspro.de/roland-eich/verteilergruppen-fuer-exchange-powershell-anlegen-verwalten
New-DistributionGroup -Name 'Strohhutpiraten' -Alias 'Mugiwara' -Type 'Security'
Add-DistributionGroupMember -Identity "Strohhutpiraten" -Member "ruffy@keadc.local"
