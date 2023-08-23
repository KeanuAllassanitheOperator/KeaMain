# Bash Script for User Quota on Nextcloud
#!/bin/bash
user="Allassani.Keanu"
realquota=$(sudo -u www-data /var/www/cloud/occ user:info $user | grep quota | tail -n 1 | cut -d ":" -f2)
quotaingb=$(( $realquota / 1000 / 1000 / 1000 ))
usedspace=$(sudo -u www-data /var/www/cloud/occ user:info $user | grep used | cut -d ":" -f2)
usedspaceingb=$(( $usedspace / 1000 / 1000 / 1000 ))
resultinpercent=$(( $usedspaceingb * 100 / $quotaingb ))
 if [ $quotaingb -eq 0 ]; then

  echo "1 \"QuotacheckNXCKA\" - $user hat kein Quota gesetzt. Unlimited Space Used: $usedspaceingb GB"

 elif [ $usedspaceingb -eq 0 ]; then

  echo "0 \"QuotacheckNXCKA\" - $user benutzt kaum Speicherplatz (unter 1 GB)"

 elif [ $resultinpercent -ge 80 ]; then

     echo "1 \"QuotacheckNXCKA\" - $user benutzt 80 % des erlaubten Speicherplatzes. Used: $usedspaceingb GB"

 elif [ $resultinpercent -ge 90 ]; then

     echo "1 \"QuotacheckNXCKA\" - $user benutzt 90 % des erlaubten Speicherplatzes Used: $usedspaceingb GB"


 else
   echo "0 \"QuotacheckNXCKA\" - $user benutzt $resultinpercent % des erlaubten Speicherplatzes Used: $usedspaceingb GB"

fi
