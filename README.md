# Docker DD

supported by peco

## Requirements

* [Docker](http://www.docker.com/)
* [peco](https://github.com/peco/peco)

## Quick start

Clone repository and load three files by ``source`` command. That's all. 

### How to

STEP 1. Clone this repository. It doesn't care of a directory at local.

```
git clone https://github.com/ontheroadjp/dopecker.git
```

STEP 2. Open your ``.bash_profile`` or ``.bashrc`` and add the following line of code:

```
source /path/to/docker-dd/docker-dd-common.fnc
source /path/to/docker-dd/docker-dd-network.fnc
source /path/to/docker-dd/docker-dd-volume.fnc
```

STEP 3. Restart shell or execute three commands that you added to ``.bash_profile`` or ``.bashrc`` in above to load to the current shell.

## Usage

Type docker-dd command like this

```bash
$ DDimages
--------------------------------
<IMAGES>
1 : nginx-amplify               latest                  c0731e1f47a6   242.3 MB
2 : nutsllc/clair-analysis-     1.0.0                   4df931c38363   837.5 MB
3 : nutsllc/toybox-php          7.0                     dde3269c436f   577.8 MB
4 : nginx                       latest                  4efb2fcdb1ab   183.4 MB
5 : postgres                    latest                  5ff2afd2f5c3   265.9 MB
6 : quay.io/coreos/clair        latest                  a76bf177c731   836.6 MB
```

Depending on the docker-dd command (ex.``DDrmi``), after the command effective it is peco window will open to select a image id/container id/network name/volume id.

## Compare docker-dd to original docker command

|docker-dd|In case of docker command|Description|
|:---|:---|:---|
|DD|docker ps -a|Show all containers|
|DDimages|docker images |Show all images|
|DDps|docker ps|Show running containers in default format|
|DDpsa|docker ps -a|Show all containers in default format|
|DDstart|docker start \<container id>|start stopped container|
|DDstop|docker stop \<container id>|Stop running container|
|DDstopa|docker stop $(docker ps -q)|Stop all of running container|
|DDrm|docker rm \<container id>|Remove a container|
|DDrma|docker rm $(docker ps -aq)|Remove all of running containers|
|DDdown|docker stop \<container id><br>docker rm \<container id>|Stop and remove running container|
|DDid|docker inspect -f '{{.Id}}' \<container id>|Show container id|
|DDrmi|docker rmi \<image id>|Remove image|
|DDrmia|docker rmi $(docker images -q)|Remove all images|
|DDnone|docker rmi $(docker images \| awk '/^<none>/ { print $3 }')|Remove \<none> image|
|DDidi|docker inspect -f '{{.Id}}' \<image id>|Show image id|
|DDbash|docker exec -it \<container id> /bin/bash|Go into container with /bin/bash|
|DDsh|docker exec -it \<container id> /bin/sh|Go into container with /bin/sh|
|DDmysql|docker exec -it \<container id> mysql -u root -proot|Go into container with mysql -u root -proot|
|DDmongo|docker exec -it \<container id> mongo -u root -p|Go into container with mongo -u root -p|
|DDmyadmin|docker run -d -e PMA_HOST=\<container IP adress> -p 8080:80 phpmyadmin/phpmyadmin|Run phpMyAdmin container and connect to your running container|
|DDstats|docker status|Display a live stream of container|
|DDtop|docker top \<container id>|Display the running processes of a container|
|DDlogs|docker logs \<container id>|Fetch the logs of a container|
|DDhistory|docker history \<image id>|Show the history of an image|
|DDinspect|docker inspect \<container id>|Return low-level information on a container|
|DDip|docker inspect -f "{{.NetworkSettings.IPAddress}}" \<container id>|Show the IP Address of a container|
|DDvol|docker |List volumes of a container mounted|
|DDhosts|docker exec -it \<container id> cat /etc/hosts|Show the contents in /etc/hosts file |
|DDenv|docker exec -it \<container id> env|List defined environment variables|
||
|DN|docker network ls|Show all networks|
|DNrm|docker network rm \<network id>|Remove a network|
|DNinspect|docker network inspect \<network id>|Display detailed information on network|
|DNgateway|docker network inspect -f '{{range .IPAM.Config}} {{.Gateway}} {{end}}' \<network id>|Show the Gateway IPv4 Address of a network|
|DNsubnet|docker network inspect -f '{{range .IPAM.Config}} {{.Subnet}} {{end}}' \<network id>|Show the Subnet IPv4 Address of a network|
|DNnode|docker network inspect -f '{{range .Containers}} {{.Name}} {{end}}'|List containers connected a network|
|DNid|docker network inspect -f '{{.Id}}' \<network id>|Show a network id |
||
|DV|docker volume ls|Show all volumes|
|DVrm|docker volume rm \<volume name>|Remove a volume|
|DVinspect|docker volume inspect \<volume name>|Display detailed information on volume|
|DVmp|docker volume inspect -f "{{.Mountpoint}}" \<volume name>|Show the directory path stored real data|
|DVid|docker volume inspect -f "{{.Name}}" \<volume name>|Show a volume name|

## License

* Docker - The Apache 2.0 Licence
* peco - The MIT Licence