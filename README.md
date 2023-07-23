docker package
============

This project is a set of Docker images.


 
## Docker 
Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. 
Containers allow a developer to package up an application with all of the parts it needs, 
such as libraries and other dependencies, and deploy it as one package. 
By doing so, thanks to the container, the developer can rest assured that the application will 
run on any other Linux machine regardless of any customized settings that machine might have that 
could differ from the machine used for writing and testing the code. In a way, Docker is a bit like a virtual machine.


Official docs: 
- https://docs.docker.com/get-started/overview/
- https://docs.docker.com/engine/reference/run/

Below some useful commands.

### Docker Images

A `Docker` image is a file, comprised of multiple layers, that is used to execute code in a Docker container.

```
FROM jboss/wildfly                                              # starting from jboss/wildfly image
ADD hello-world.war /opt/jboss/wildfly/standalone/deployments/  # add the war in the remote path
```

```
docker build --tag=hello-world-war .    # build hello-world-war image using Docker file in the actual position
```

```
docker images                                                # list all images
docker rmi image_name   (-f force)                           # remove image

docker build --shm-size=1G -t hello-world-war .              # build image with size of /dev/shm of 1G
docker save -o hello-world-war.tar hello-world-war:latest    # save image in a file
docker load --input hello-world-war.tar                      # load image from a file
```

### Docker containers
Docker container is an executable form of a docker image. 
You can have multiple Docker containers from a single docker image.

```
docker run -it -p 8080:8080 hello-world-war    # run the container on port 8080 using the previous image
```

```
docker ps                                      # list all running containers
docker ps -a                                   # list all containers (stopped)
docker ps -a -f status=running                 # list all containers with status running
docker ps -aq -f status=exited                 # list all containers ID already stopped
docker rm $(docker ps -aq -f status=exited)    # remove all stopped container
docker rm $(docker ps -aq)                     # remove all stopped container

docker stop containerID                        # stop containerID
docker exec -it <container_id> bash            # open a bash console in containerID
docker inspect <container_id>                  # see container details as json 
```


### Test an App running on the container
```
http://localhost:8080/hello-world/
```






# See

https://medium.com/faun/understanding-docker-container-memory-limit-behavior-41add155236c
https://thorsten-hans.com/limit-memory-for-docker-containers
https://phoenixnap.com/kb/docker-memory-and-cpu-limit




