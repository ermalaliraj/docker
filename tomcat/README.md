Running Tomcat 8.5.57 on Docker
============

You can run a `Tomcat` container in your local in two ways:

1) Create your image with the webapp `manager.war` already configured, and run a container each time you need Tomcat running.
2) Run a container using the remote image and configure it using linux `bash` console.


### 1) Create your local image using Docker file
```
docker build --tag=ea/tomcat8 .
docker run -it -p 7001:8080  --name ea.tomcat8 ea/tomcat8
docker exec -it ea.tomcat8 bash
```

##### 1.1 Test using ermal/admin
```
http://localhost:7001/manager
```

### 2) Run the container and configure it

```
docker image pull tomcat:8.5.57
docker container create --publish 7000:8080 --name tomcat8 tomcat:8.5.57
docker start tomcat8
docker exec -it tomcat8 bash
```

##### 2.1 Restore `webapps.dist`

The standard image contains an an empty folder `webapps` and all the apps are contained in `webapps.dist`

```
rm -rf webapps
mv webapps.dist webapps
```

##### 2.2 Download vim
You need `vim` to modify the container's files.

```
apt-get update
apt-get install vim
```

##### 2.3 Update tomcat-users.xml  
Add role and user
```
vim /usr/local/tomcat/conf/tomcat-users.xml  

# Add the following lines in tomcat-user.xml
<role rolename="manager-gui"/>
<user username="ermal" password="admin" roles="manager-gui"/>
```

##### 2.3 Update Manager context.xml
Remove the restriction to access GUI from a different machine too.
```
vim /usr/local/tomcat/webapps/manager/META-INF/context.xml
 
 # comment the element  <Valve>
 <!--
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
 -->
```

##### 2.4 Test using ermal/admin
```
http://localhost:7001/manager
```






