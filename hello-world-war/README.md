Hello World Webapp
============

Create a jboss Wildfly image and deploy `hello-world.war`

### Docker file
```
FROM jboss/wildfly                                              
ADD hello-world.war /opt/jboss/wildfly/standalone/deployments/
```

### Build docker image and run the container
```
docker build --tag=hello-world-war .                 # build
docker run -it -p 8080:8080 hello-world-war          # run
```

### Test
```
http://localhost:8080/hello-world/
```

