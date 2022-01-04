#!/bin/sh

echo "###########################################################################"
echo "#Escrito por Saulo Quintal                                                #"
echo "#Script escrito para processo de backup automatizado do grafana no bacula.#"
echo "#Script livre para reprodução e alteração.                                #"
echo "#Contato: sauloquintal@gmail.com                                          #"
echo "###########################################################################"
echo "---------------------------------------------------------------------------"

BK_ORIGEM=/var/lib/grafana/

BK_DEST=/home/backup/grafana/

###REALIZANDO BACKUP COMPLETO VAR/LIB/GRAFANA###
sudo tar -czf $BK_DEST/var-lib-grafana-`date +%Y-%m-%d`.tar.gz $BK_ORIGEM

BK_ORIGEM1=/usr/share/grafana/

###REALIZANDO BACKUP COMPLETO USR/SHARE/GRAFANA###
sudo tar -czf $BK_DEST/usr-share-grafana-`date +%Y-%m-%d`.tar.gz $BK_ORIGEM1

echo "--------------------------------"
echo "-PROCESSO DE BACKUP FINALIZADO!-"
echo "--------------------------------"