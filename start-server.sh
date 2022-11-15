#!/bin/bash
version_mine="server-1-19-2"

echo "What version wanna run minecraft-server ?"
echo "1 - 1.19.2 (Default)"
echo "2 - 1.12.2"
read version

echo "Who much ram allocate to server ? (4096M)"
read ramsize

if [ ramsize == "" ] || [ ramsize == "0" ]
then
	ramsize="4096M"
fi

if [ $version == "2" ] || [ $version == "1.12.2" ]
then
	version_mine="server-1-12-2"	
fi

cd server-data
java -Xmx$ramsize -Xms$ramsize -jar server-versions/$version_mine.jar nogui --world world_$version_mine

echo "Wanna backup world ?(N/y)"
read backup

if [ $backup == "Y" ] || [ $backup == "y" ]
then
	echo "Backup files!!"
	echo "Running..."
	dir_name=$(date +%d_%m_at_%H:%M)
	mkdir $dir_name
	cp -r world_$version_mine $dir_name/
	rar a ../backups/world_$dir_name-$version_mine.rar $dir_name
	rm -rf $dir_name
	echo "Backup success!!"
fi
