# Setup Docker with Portainer on Samsung DeX

## Big Thanks to ... for making this possible
- https://github.com/egandro/docker-qemu-arm
- https://gist.github.com/oofnikj/e79aef095cd08756f7f26ed244355d62

### Setup process

Download Termux from [F-Droid](https://www.f-droid.org/) store and install it. 

Setup Alpine VM on Termux with this one-line-install command
```
curl -o termux-setup.sh https://raw.githubusercontent.com/egandro/docker-qemu-arm/master/termux-setup.sh && chmod 755 ./termux-setup.sh && ./termux-setup.sh
```
*Will take around 8 minutes to complete*

cd in to alpine directory
```
cd alpine
```

Make backup copy of `startqemu.sh` file
```
mv startqemu.sh bk_startqemu.sh
```


Create new `startqemu.sh` file
```
nano startqemu.sh
```

Copy content bellow in to new `startqemu.sh` file. This will expose nessesary ports to access containers from browser.\
If you want assign more ram to VM amend value in first line. Example `-m 1024` = 1GB ram
```
qemu-system-x86_64 -machine q35 -m 1024 -smp cpus=2 -cpu qemu64 \
-drive if=pflash,format=raw,read-only,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
-netdev user,id=n1,\
hostfwd=tcp::9000-:9000,\
hostfwd=tcp::2222-:22 -device virtio-net,netdev=n1 \
-nographic alpine.img
```
Press ctrl + x, y and Enter to save it.

Make new file executible
```
chmod +x startqemu.sh
```

Start Alpine VM using new `startqemu.sh` file
```
./startqemu.sh
```
**NOTE** - Default login details:\
User `root`\
Passwd `Secret123`

Portainer-CE container install command
```
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

You can double check if Portainer-CE working by running command
```
docker ps
```

To access Portainer Dashboard from same device
```
http://localhost:9000
```
To access Portainer Dashboard from another device on same network you will need to know your device local IP address. Example `192.168.*.*` followed by Portainer port `:9000`

### Portainer on DeX
![Portainer_on_dex](/assets/images/portainer_on_dex.png)
