FROM tomcat:8.5.57
ADD conf/tomcat-users.xml /usr/local/tomcat/conf/
ADD manager/context.xml /usr/local/tomcat/webapps.dist/manager/META-INF/


RUN rm -rf webapps; \
    mv webapps.dist webapps