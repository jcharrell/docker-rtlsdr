# docker-rtlsdr

## Installing Docker

```shell
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
$ echo "deb [arch=armhf] https://download.docker.com/linux/raspbian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
$ sudo usermod -aG docker pi
```
Following the `usermod` command, you will need to logout and back in with the pi user, in order to run `docker` commands without
needing to supply `sudo`.

## Usage

### rtl_tcp as background daemon
```shell
docker run -d -p 1234:1234 --device=/dev/bus/usb --name rtl_tcp johncharrell/raspbian-rtlsdr rtl_tcp -a 0.0.0.0
```

### rtl_tcp interactively
```shell
docker run -id -p 1234:1234 --device=/dev/bus/usb --name rtl_tcp johncharrell/raspbian-rtlsdr rtl_tcp -a 0.0.0.0
```


