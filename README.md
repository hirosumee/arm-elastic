# rpi-elasticsearch

Elasticsearch arm-compatible docker image 

```
docker pull jritsema/rpi-elasticsearch:2.4.0
```

docker-compose.yml
```
elasticsearch:
  image: jritsema/rpi-elasticsearch:2.4.0
  volumes:
    - ./elasticsearch:/data
  ports:
    - "9200:9200"
    - "9300:9300"
  environment:
    - CLUSTER_NAME=my-cluster
    - LISTEN=0.0.0.0
  restart: always
```

(tested on a raspberry pi 3, Linux 4.4.50-v7+ armv7l GNU/Linux)
