# Setup Docker with Portainer on Samsung DeX 1.0

## Big Thanks to ... for making this possible
- https://github.com/egandro/docker-qemu-arm
- https://gist.github.com/oofnikj/e79aef095cd08756f7f26ed244355d62

### Setup process

* Download Termux from [F-Droid](https://www.f-droid.org/) store and install it. 

* Setup Alpine VM on Termux with this one-line-install command
  ```
  curl -o termux-setup.sh https://raw.githubusercontent.com/egandro/docker-qemu-arm/master/termux-setup.sh && chmod 755 ./termux-setup.sh && ./termux-setup.sh
  ```
  *Will take around 8 minutes to complete*

* curl script which will backup existing `startqemu.sh` to `bk_startqemu.sh` and create new one in it's place.
  ```
  ~ $ curl -o setup.sh https://raw.githubusercontent.com/mrp-yt/docker_and_portainer_on_dex/main/portainer_port.sh && chmod 755 ./setup.sh && ./setup.sh && rm setup.sh
  ```

* Start Alpine VM using new `startqemu.sh` file
  ```
  ./startqemu.sh
  ```
  **NOTE** - Default login details:\
  User `root`\
  Passwd `Secret123`

* Portainer-CE container install command
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
* To access Portainer Dashboard from another device on same network you will need to know your device local IP address. Example `192.168.*.*` followed by Portainer port `:9000`
  
* Portainer on DeX \
![Portainer_on_dex](/assets/images/portainer_on_dex.png)
