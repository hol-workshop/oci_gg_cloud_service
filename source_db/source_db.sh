#!/bin/bash
#export DBCA_SAMPLE_SCHEMA=yes >> /u01/ocidb/params.ini
mount /u01
/u01/ocidb/GenerateNetconfig.sh -a
echo DBCA_SAMPLE_SCHEMA=yes >> /u01/ocidb/params.ini
/u01/ocidb/buildsingle.sh -s

echo '${config_file}' >> /home/oracle/script.sql
sudo chown oracle:oinstall /home/oracle/script.sql

echo '${config_file2}' >> /home/oracle/update.sql
sudo chown oracle:oinstall /home/oracle/update.sql

pid=`pgrep buildcluster.sh`
while kill -0 $pid >/dev/null 2>&1
do
  echo $pid
  sleep 0.5
done
  echo "process is done"
  sudo su - oracle bash -c 'sqlplus / as sysdba @/home/oracle/script.sql'

sudo firewall-cmd --zone=public --permanent --add-port=22/tcp
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp
sudo firewall-cmd --zone=public --permanent --add-port=443/tcp
sudo firewall-cmd --zone=public --permanent --add-port=1521-1522/tcp
sudo firewall-cmd --reload
echo "process is done"
