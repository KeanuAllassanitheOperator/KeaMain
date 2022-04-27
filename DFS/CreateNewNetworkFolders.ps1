mkdir C:\DFSRoots\Resources
New-SmbShare –Name "Resources" –Path "C:\DFSRoots\Resources" -FullAccess "KeaDC0\Administrator"
New-DfsnRoot -Path '\\keadc.local\Resources' -Type DomainV2 -TargetPath '\\keadc\Resources'