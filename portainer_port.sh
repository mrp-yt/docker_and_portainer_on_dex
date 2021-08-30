cd /alpine &&
# Backup
mv startqemu.sh bk_startqemu.sh &&
# curl amended version
curl -o startqemu.sh https://raw.githubusercontent.com/mrp-yt/docker_and_portainer_on_dex/main/startqeme.sh &&
chmod 755 ./startqemu.sh
