$YourDirToCompress=""
$ZipFileResult=""
$DirToExclude=@("ADSPJAVMDK")

Get-ChildItem $YourDirToCompress -Directory  | 
           where { $_.Name -notin $DirToExclude} | 
              Compress-Archive -DestinationPath $ZipFileResult -Update
