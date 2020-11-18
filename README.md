# docker-crowd
# crowd
default port: 8080

## How to run with docker

- start crowd

```
    docker run -p 8095:8095 -v crowd_home_data:/var/crowd --network crowd-network --name crowd-srv -e TZ='Asia/Shanghai' zouchengli/crowd
```
## How to run with docker-compose

- start crowd & mysql daemon

```
    docker-compose up -d
```