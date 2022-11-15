#!/bin/bash

echo "Who much ram allocate to server ? (4096M)"
read ramsize

cd server-data
java -Xmx$ramsize -Xms$ramsize -jar server-1-19-2.jar nogui

echo "Wanna backup world ?(N/y)"
read backup

if [ $backup == "Y" ] || [ $backup == "y" ]
then
	echo "Backup files!!"
	echo "Running..."
	dir_name=$(date +%d_%m_at_%H:%M)
	echo $dir_name
	mkdir $dir_name
	cp -r world $dir_name/
	rar a ../backups/$dir_name.zip $dir_name
	rm -rf $dir_name
	echo "Backup success!!"
fi
