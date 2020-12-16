Running Tomcat 8.5.57
============

You can create a Tomcat image with the `manager.war` configured, and run a container each time you need Tomcat running, 
or run a container using the remote image and configure it accessing `linux` bash console.


### 1) Create your pre-configured local image using Docker file
```
docker build --tag=ea/tomcat8 .
docker run -it -p 7001:8080  --name ea.tomcat8 ea/tomcat8
docker exec -it ea.tomcat8 bash
```

### 2) Run container and configure it

```
docker image pull tomcat:8.5.57
docker container create --publish 7000:8080 --name tomcat8 tomcat:8.5.57
docker start tomcat8
docker exec -it tomcat8 bash
```


##### 2.1 Restore `webapps.dist`

The image do have an empty folder `webapps` and all the apps are contained in `webapps.dist`

```
rm -rf webapps
mv webapps.dist webapps
```

##### 2.2 Download vim

```
apt-get update
apt-get install vim
```

##### 2.3 Update tomcat-users.xml  

```
vim /usr/local/tomcat/conf/tomcat-users.xml  

# Add the following lines in tomcat-user.xml
<role rolename="manager-gui"/>
<user username="ermal" password="admin" roles="manager-gui"/>
```

##### 2.3 Update Manager context.xml
```
vim /usr/local/tomcat/webapps/manager/META-INF/context.xml
 
 # comment the element  <Valve>
 <!--
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
 -->
```

### Test using ermal / admin
```
http://localhost:7001/manager
```






