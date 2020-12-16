# wildfly

Example of creating a jboss Wildfly image with the war `hello-world.war`

### Docker file
```
FROM jboss/wildfly                                              # starting from jboss/wildfly image
ADD hello-world.war /opt/jboss/wildfly/standalone/deployments/  # add the war in the remote path
```

### Build image and container
```
docker build --tag=hello-world-war .                 # build
docker run -it -p 8080:8080 hello-world-war          # run
```

### Test
```
http://localhost:8080/hello-world/
```






