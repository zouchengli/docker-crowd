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

## How to hack crowd

```
docker exec crowd-srv java -jar /var/agent/atlassian-agent.jar \
    -p crowd \
    -m chengli.zou@gmail.com \
    -n chengli.zou@gmail.com \
    -o http://localhost:8095 \
    -s copy-you-server-id
```

## How to hack crowd plugin

- .eg I want to use BigGantt plugin
1. Install BigGantt from crowd marketplace.
2. Find `App Key` of BigGantt is : `eu.softwareplant.biggantt`
3. Execute :

```
docker exec crowd-srv java -jar /var/agent/atlassian-agent.jar \
    -p eu.softwareplant.biggantt \
    -m chengli.zou@gmail.com \
    -n chengli.zou@gmail.com \
    -o http://localhost:8095 \
    -s copy-you-server-id
```

4. Paste your license 