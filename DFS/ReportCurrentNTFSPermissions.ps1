$OutFile = "C:\PSScripts\Dumps\CurrentPermissions.csv" # Insert folder path where you want to save your file and its name 
$RootPath = "" # Insert your share directory path 
$Header = "Ordner,Benutzer oder Gruppe,Zugriffserlaubnis, NTFS-Berechtigungen,Vererbung,AnwendenAuf" 
 #$Header = "Folder Path,IdentityReference,AccessControlType,IsInherited,InheritanceFlags,PropagationFlags,FilesystemRights" 
$FileExist = Test-Path $OutFile  
If ($FileExist -eq $True) {Del $OutFile}  
Add-Content -Value $Header -Path $OutFile  
# Einstellung ob Verzeichnisse oder alle Dateien , Ordner Unterordner
$Folders = Get-ChildItem $RootPath -Directory
#where {$_.psiscontainer -eq $True}  
foreach ($Folder in $Folders){ 
   $ACLs = get-acl $Folder.fullname | ForEach-Object { $_.Access  } 
   Foreach ($ACL in $ACLs){ 
   # Diese beiden FlagAttribute abfangen und abfragen. Hier übersetze ich für welche Objekte die Berechtigung gilt. Z.B alle Files in diesem Ornder, oder der jetzige und alle Unterordner
   $IFlags = $ACL.InheritanceFlags
   $PFlags = $ACL.PropagationFlags
   if ($IFlags -eq "None" -and $PFlags -eq "None") {
    $translate = "Nur Ordner"
    $OutInfo = $Folder.Name + "," + ($ACL.IdentityReference -replace ',','/')  + "," + ($ACL.AccessControlType -replace ',','/') + ","  + ($ACL.FileSystemRights -replace ',','/' )  + "," + ($ACL.IsInherited -replace ',','/') + "," + ($translate -replace ',','/') + ","      
    Add-Content -Value $OutInfo -Path $OutFile 
   }
    elseif ( $IFlags -eq "ContainerInherit, ObjectInherit" -and $PFlags -eq "None") {
      $translate = "Ordner,Unterordner,Dateien"
      $OutInfo = $Folder.Name + "," + ($ACL.IdentityReference -replace ',','/')  + "," + ($ACL.AccessControlType -replace ',','/') + ","  + ($ACL.FileSystemRights -replace ',','/' )  + "," + ($ACL.IsInherited -replace ',','/') + "," + ($translate -replace ',','/') + ","  
      Add-Content $OutInfo -Path $OutFile 
    }

    elseif ( $IFlags -eq "ContainerInherit" -and $PFlags -eq "None") {
      $translate = "Ordner,Unterordner"
       $OutInfo = $Folder.Name + "," + ($ACL.IdentityReference -replace ',','/')  + "," + ($ACL.AccessControlType -replace ',','/') + ","  + ($ACL.FileSystemRights -replace ',','/' )  + "," + ($ACL.IsInherited -replace ',','/') + "," + ($translate -replace ',','/') + ","   
      Add-Content -Value $OutInfo -Path $OutFile 
    }
     elseif ( $IFlags -eq "ObjectInherit" -and $PFlags -eq "None") {
        $translate = "Ordner,Dateien"
         $OutInfo = $Folder.Name + "," + ($ACL.IdentityReference -replace ',','/')  + "," + ($ACL.AccessControlType -replace ',','/') + ","  + ($ACL.FileSystemRights -replace ',','/' )  + "," + ($ACL.IsInherited -replace ',','/') + "," + ($translate -replace ',','/') + ","     
        Add-Content -Value $OutInfo -Path $OutFile 
    }
     elseif ( $IFlags -eq "ContainerInherit, ObjectInherit" -and $PFlags -eq "InheritOnly") {
      $translate = "Unterordner,Dateien"
       $OutInfo = $Folder.Name + "," + ($ACL.IdentityReference -replace ',','/')  + "," + ($ACL.AccessControlType -replace ',','/') + ","  + ($ACL.FileSystemRights -replace ',','/' )  + "," + ($ACL.IsInherited -replace ',','/') + "," + ($translate -replace ',','/') + ","     
      Add-Content -Value $OutInfo -Path $OutFile 
    }
     elseif ( $IFlags -eq "ContainerInherit" -and $PFlags -eq "InheritOnly") {
      $translate = "Nur dieser Unterordner"
       $OutInfo = $Folder.Name + "," + ($ACL.IdentityReference -replace ',','/')  + "," + ($ACL.AccessControlType -replace ',','/') + ","  + ($ACL.FileSystemRights -replace ',','/' )  + "," + ($ACL.IsInherited -replace ',','/') + "," + ($translate -replace ',','/') + ","     
      Add-Content -Value $OutInfo -Path $OutFile 
    }
     elseif ( $IFlags -eq "ObjectInherit" -and $PFlags -eq "InheritOnly") {
      $translate = "Nur Dateien"
       $OutInfo = $Folder.Name + "," + ($ACL.IdentityReference -replace ',','/')  + "," + ($ACL.AccessControlType -replace ',','/') + ","  + ($ACL.FileSystemRights -replace ',','/' )  + "," + ($ACL.IsInherited -replace ',','/') + "," + ($translate -replace ',','/') + ","    
      Add-Content -Value $OutInfo -Path $OutFile 
    }
    
   }}

   ii $OutFile
