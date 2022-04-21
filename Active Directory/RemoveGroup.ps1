#In Form einer Textdatei oder als Listenobjekt von Strings Gruppennamen anlegen und löschen #
$liste = @('')
foreach ($i in $liste) {
Remove-ADGroup -Identity $i
}
