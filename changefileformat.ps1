 Dir *.ps1 | rename-item -newname { [io.path]::ChangeExtension($_.name, "txt") }
