## install docker on CentOS
cat /etc/redhat-release
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker woo

## install docker on CentOS
cat /etc/redhat-release


### Docker Hub
| Title | Description |
| ----- | ----------- |
| overview | https://hub.docker.com/ docker registry <br/>
git clone https://github.com/linuxacademy/content-widget-factory-inc |
| build httpd | docker pull httpd:2.4 <br/> docker run --name httpd -p 8080:80 -v $(pwd):/usr/local/apache2/htdocs:ro -d httpd:2.4 <br/> docker ps -a; 127.0.0.1:8080 |

### Handcrafting a Container Image
| Title | Description |
| ----- | ----------- |
| Run Base Image | docker run --name webtemplate -d httpd:2.4 |
| Install Tools and Code | docker exec -it webtemplate bash <br/> apt update && apt install git -y <br/> git clone  https://github.com/linuxacademy/content-widget-factory-inc.git /tmp/widget-factory-inc <br/> rm htdocs/index.html <br/> cp -r /tmp/widget-factory-inc/web/* htdocs/ |
| Create an Image from the Container | docker ps; docker commit <CONTAINER_ID> example/widgetfactory:v1 |
| Template for a Second Version | docker exec -it webtemplate bash <br/> rm -rf /tmp/widget-factory-inc/  <br/> apt remove git -y && apt autoremove -y && apt clean ; exit <br/> docker ps; docker commit <CONTAINER_ID> example/widgetfactory:v2 <br/> docker run -d --name web1 -p 8081:80 example/widgetfactory:v2 |

## Storage
### Storing Container Data In Docker Volumes
| Title | Description |
| ----- | ----------- |
| Anonymous Docker Volumes | docker run -d --name db1 postgres:12.1 docker; run -d --name db1 postgres:12.1 <br/> docker ps; docker volume ls <br/> docker inspect db1 -f '{{ json .Mounts }}' | python -m json.tool <br/> docker run -d --rm --name dbTmp postgres:12.1 <br/> docker volume ls |
| Creating docker volume | docker volume create website; docker volume ls<br/> sudo cp -r $(pwd)/web/* /var/lib/docker/volumes/website/_data/ |
| Back up and Restore Volume | docker volume inspect website <br/> tar czf /tmp/website_$(date +%Y-%m-%d-%H%M).tgz -C /var/lib/docker/volumes/website/_data . <br/>tar tf /tmp/<BACKUP_FILE_NAME>.tgz; exit;  <br/>docker run -it --rm -v website:/website -v /tmp:/backup bash tar czf /backup/website_$(date +%Y-%m-%d-%H-%M).tgz -C /website . <br/>rm * -rf /var/lib/docker/volumes/website/_data <br/>tar xf /tmp/website_2022-04-21-23-44.tgz . | 
|||
|||
|||
|||
|||
|||
|||

