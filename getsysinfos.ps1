$computerSystem = Get-CimInstance CIM_ComputerSystem
$SerialNumber = Get-CimInstance CIM_BIOSElement | Select-Object SerialNumber -ExpandProperty SerialNumber -First 1
$computerOS = Get-CimInstance CIM_OperatingSystem
$computerCPU = Get-CimInstance CIM_Processor
$RAMClass = Get-WmiObject -Class Win32_PhysicalMemoryArray
$RamSlots = Get-WmiObject -Class "Win32_PhysicalMemoryArray" | Select-Object -ExpandProperty MemoryDevices -First 1
# speicherort muss angepasst werden
$infofilecsv = "C:\Users\keanu\mysystem.csv"
$Disk = get-disk -Number 0
$one_gb = 1000*1000*1000
$one_gib = 1024*1024*1024
$RoundedDiskSpace = ("{0:N0}" -f ((($Disk).AllocatedSize)/$one_gb) + " GB")
$computerRAM =  ("{0:N0}" -f ((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /$one_gib) + " GB")
$RamTypeCode =  (Get-WmiObject Win32_PhysicalMemory).SMBiosMemoryType | Select-Object -First 1
$MaxRAM = ("{0:N0}" -f ($RAMClass.maxcapacity/1024/1024) + " GB")
$ComputerOSInfo = ($computerOS.caption + " ")
$DriveType = (Get-PhysicalDisk).MediaType | Select-Object -First 1
#$Usedby = (Get-WMIObject -ClassName Win32_ComputerSystem).Username

#Check if Computer is in Domain
if ((Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain -eq $false) {
   $Domain = "Nein"  
 }
 else {
       $Domain = "Ja"      
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
  Festplattentyp = $DriveType
  Betriebssystem = $computerOSInfo
  CPU =  $computerCPU.Name
  'Benutzung von' = " "
  'CPU-Passmark' = " " 
  'MI/TN' =  " "
   'Eingelagert bei' = " "
    Besonderheiten = " "
    'Letzte Wartung/Auslieferung' = " "
    'ist Mitglied in der Domain' = $Domain
  
 } 
 $Computerobject | Select-Object Seriennummer,Marke,Modell,RAM,'max. RAM','RAM Type','Anzahl Ram-Slots',Festplatte,Festplattentyp,Betriebssystem,CPU,'CPU-Passmark','MI/TN','Eingelagert bei','Benutzung von',Besonderheiten,'Letzte Wartung/Auslieferung','ist Mitglied in der Domäne ' | Export-CSV -Delimiter ";" $infofilecsv -notype -Append 
#Import-Csv $infofilecsv
ii $infofilecsv
