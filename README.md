# docker-crowd
# crowd
default port: 8095

## How to run with docker

- start crowd

```
    docker run -p 8095:8095 -v crowd_home_data:/var/crowd --name crowd-srv -e TZ='Asia/Shanghai' zouchengli/crowd
```
## How to run with docker-compose

- start crowd & mysql daemon

```
    docker-compose up -d
```
