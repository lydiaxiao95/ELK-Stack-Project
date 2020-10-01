#! /bin/bash

cd /home/sysadmin/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis


cat $1_Dealer_schedule | grep $2 | grep $3 | awk -F" " '{print $0}'
