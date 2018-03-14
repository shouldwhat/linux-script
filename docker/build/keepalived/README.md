# My First Image Build Directory.

```
# docker build -t keepalived .
Sending build context to Docker daemon  740.9kB
Step 1/2 : FROM centos
latest: Pulling from library/centos
5e35d10a3eba: Pull complete
Digest: sha256:dcbc4e5e7052ea2306eed59563da1fec09196f2ecacbe042acbdcd2b44b05270
Status: Downloaded newer image for centos:latest
 ---> 2d194b392dd1
Step 2/2 : ADD . /
 ---> 2936f1f1f75d
Successfully built 2936f1f1f75d
Successfully tagged keepalived:latest
# 
# docker images
# docker run -it keepalived
# 
```
