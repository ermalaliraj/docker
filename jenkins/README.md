Running Jenkins on Docker
============
https://hub.docker.com/r/jenkins/jenkins
https://www.jenkins.io/doc/book/installing/docker/
https://www.popularowl.com/jenkins/automating-jenkins-install-docker-terraform/

You can run a `Jenkins` container in your local in two ways:

1) Create your configured image and run a container each time you need Jenkins running.
2) Run a container using the remote image and configure it using linux `bash` console.


### 1) Create your local image using Docker file
https://www.popularowl.com/jenkins/automating-jenkins-install-docker-terraform/

```
docker build --tag=ea/jenkins .
docker run -it -p 7003:8080  --name ea.jenkins ea/jenkins
docker exec -it ea.jenkins bash
```



##### 1.1 Test using ermal/admin
```
http://localhost:7002
```

##### 1.2 Logs
```
docker logs -f ea.tomcat8
```

### 2) Run the container and configure it
```
docker pull jenkins/jenkins
docker create --publish 7002:8080 --name jenkins jenkins/jenkins:latest
docker start jenkins
docker logs -f jenkins
```

Copy the password from the log, or connect from a different `bash` and read it from the file
```
cat /var/jenkins_home/secrets/initialAdminPassword
docker exec -it jenkins bash
```



LOCAL
8060  admin/admin
http://localhost:8060
C:\Users\admin\AppData\Local\Jenkins


mvn clean install pmd:pmd