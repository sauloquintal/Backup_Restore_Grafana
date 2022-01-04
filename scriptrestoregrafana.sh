#!/bin/sh

DIRBKP=/home/backup/grafana/

echo "###########################################################################"
echo "#Escrito por Saulo Quintal                                                #"
echo "#Script escrito para processo de restore automatizado do grafana no bacula#"
echo "#Script livre para reprodução e alteração.                                #"
echo "#Contato: sauloquintal@gmail.com                                          #"
echo "###########################################################################"
echo "---------------------------------------------------------------------------"

ARQ=`sudo find $DIRBKP -type f -printf '%T+ %p\n' | sort | cut -d/ -f5 | head -n 1`

sudo find $DIRBKP -type f -printf '%T+ %p\n' | sort | cut -d/ -f5 | head -n 1 >> /tmp/tmp.txt

sudo sed -i 's/var-lib-grafana-/usr-share-grafana-/g' "/tmp/tmp.txt"

ARQ1=`cat /tmp/tmp.txt`

sudo rm -f /tmp/tmp.txt

systemctl stop grafana-server.service

sudo tar -zxf $DIRBKP$ARQ -C /

sudo tar -zxf $DIRBKP$ARQ1 -C /

systemctl start grafana-server.service

echo "---------------------------------"
echo "-PROCESSO DE RESTORE FINALIZADO!-"
echo "---------------------------------"