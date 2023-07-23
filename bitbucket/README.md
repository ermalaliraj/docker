Running BitBucket on Docker
============

https://hub.docker.com/u/atlassian
https://my.atlassian.com/license/evaluation 

### Bitbucket
https://hub.docker.com/r/atlassian/bitbucket-server/
```
docker volume create --name bitbucketVolume
docker run --rm -v bitbucketVolume:/var/atlassian/application-data/bitbucket --name="bitbucket" -d -p 7990:7990 -p 7999:7999 atlassian/bitbucket-server
```

```
http://localhost:7990
```

### Jira
https://hub.docker.com/r/atlassian/jira-software

```
docker run --rm -v jiraVolume:/var/atlassian/application-data/jira --name="jira" -d -p 8080:8080 atlassian/jira-software

```
```
 http://localhost:8080
```


### Bamboo
```
docker volume create --name bambooVolume
docker run --rm -v bambooVolume:/var/atlassian/application-data/bamboo --name="bamboo" --init -d -p 54663:54663 -p 8085:8085 atlassian/bamboo-server
docker run -v /data/bamboo:/var/atlassian/application-data/bamboo --name="bamboo-server" --host=bamboo-server --init -d -p 54663:54663 -p 8085:8085 atlassian/bamboo-server
```



```
http://localhost:8085
```