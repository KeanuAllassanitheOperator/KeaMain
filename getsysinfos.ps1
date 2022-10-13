$computerSystem = Get-CimInstance CIM_ComputerSystem
$SerialNumber = Get-CimInstance CIM_BIOSElement | Select-Object SerialNumber -ExpandProperty SerialNumber -First 1
$computerOS = Get-CimInstance CIM_OperatingSystem
$computerCPU = Get-CimInstance CIM_Processor
$RAMClass = Get-WmiObject -Class Win32_PhysicalMemoryArray
$RamSlots = Get-WmiObject -Class "Win32_PhysicalMemoryArray" | Select-Object -ExpandProperty MemoryDevices -First 1
# speicherort muss angepasst werden
$infofilecsv = "C:\Users\megabit\AllLaptops.csv"
 if (Test-Path -Path $infofilecsv) { 
    Remove-Item $infofilecsv
   } 

$Disk = get-disk
$one_gb = 1000*1000*1000
$RoundedDiskSpace = ("{0:N0}" -f (((get-disk).AllocatedSize)/$one_gb) + " GB")
$computerRAM = ("{0:N0}" -f ($computerSystem.TotalPhysicalMemory/1GB) + " GB")
$RamTypeCode =  Get-WmiObject Win32_PhysicalMemory | Select-Object SMBiosMemoryType -ExpandProperty MemoryType -First 1
$MaxRAM = ("{0:N0}" -f ($RAMClass.maxcapacity/1024/1024) + " GB")
$ComputerOSInfo = ($computerOS.caption + " ")
$mediaType = (Get-PhysicalDisk).MediaType
#$Usedby = (Get-WMIObject -ClassName Win32_ComputerSystem).Username

#Check if Computer is in Domain
if ((Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain -eq $false) {
   Write-Host "Computer is not a member of "
     
 }
 else {
       Write-Host "Computer is a member of "
         
     }
# Check RAM Type and assign DDR Type (ab DDR3 und aufwärts die abfragen)
 if ($RamTypeCode -eq 24) {
    $DDR = "DDR3"

  }

  elseif ($RamTypeCode -eq 26) {
          $DDR = "DDR4"
   }

  
  elseif ($RamTypeCode -eq 20) {
          $DDR = "DDR"
   }
   elseif ($RamTypeCode -eq 21) {
          $DDR = "DDR2"
   }
# Create Object


 $Computerobject = new-object psobject -Property @{

 
  Seriennummer =  $SerialNumber
  Marke =  $computerSystem.Manufacturer
  Modell = $computerSystem.Model
  RAM = $ComputerRAM
  'max. RAM' = $MaxRAM
  'RAM Type' = $DDR
  'Anzahl Ram-Slots' = $RamSlots
  Festplatte = $RoundedDiskSpace
  Festplattentyp = $mediatype
  Betriebssystem = $computerOSInfo
  CPU =  $computerCPU.Name
  'Benutzung von' = " "
  'CPU-Passmark' = " " 
  'MI/TN' =  " "
   'Eingelagert bei' = " "
    Besonderheiten = " "
    'Letzte Wartung/Auslieferung' = " "
  
 } 
 $Computerobject | Select-Object Seriennummer,Marke,Modell,RAM,'max. RAM','RAM Type','Anzahl Ram-Slots',Festplatte,Festplattentyp,Betriebssystem,CPU,'CPU-Passmark','MI/TN','Eingelagert bei','Benutzung von',Besonderheiten,'Letzte Wartung/Auslieferung' | Export-CSV $infofilecsv -NoTypeInformation -Append
 ii $infofilecsv
