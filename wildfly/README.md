# wildfly

# Docker file
```
FROM jboss/wildfly                                                   # create a linux machine starting from jboss/wildfly image
ADD hello-world.war /opt/jboss/wildfly/standalone/deployments/       # add the file hello-world.war in teh remote path
```

# build image and container
```
docker build --tag=hello-world-war .   
docker run -it -p 8080:8080 hello-world-war         
```

# Test
```
http://localhost:8080/hello-world/
```






