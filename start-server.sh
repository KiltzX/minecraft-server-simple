echo "Who much ram allocate to server ? (4096M)"
read ramsize

cd server-data
java -Xmx$ramsize -Xms$ramsize -jar server-1-19-2.jar nogui
