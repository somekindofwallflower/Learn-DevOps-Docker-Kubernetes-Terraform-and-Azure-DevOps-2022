#!/bin/bash

docker --version
docker run hello-world

docker run -p 5000:5000 in28min/hello-world-java:0.0.1.RELEASE
docker image ls
docker image history 4f6bc0e79b5b
docker image history 4f6bc0e79b5b --no-trunc
docker run -p 5000:5000 in28min/hello-world-java:0.0.1.RELEASE
docker run -d -p 5000:5000 in28min/hello-world-python:0.0.1.RELEASE
docker stop a7514033036e

docker images
docker pull mysql
docker container ls
docker search mysql
docker images
docker image history 4f6bc0e79b5b
docker image history in28min/hello-world-python:0.0.1.RELEASE
docker image inspect 4f6bc0e79b5b
docker image remove mysql
docker images
docker image remove in28min/hello-world-java:0.0.1.RELEASE
docker container rm a7514033036e
docker container ls -a

docker container run -p 5000:5000 -d in28min/hello-world-java:0.0.1.RELEASE
# 76d18d9b7d

docker container pause 76d18d9b7d
docker container unpause 76d18d9b7d
docker container stop 76d18d9b7d
docker container inspect 76d18d9b7d
docker container prune

docker container run -p 5000:5000 -d in28min/hello-world-python:0.0.1.RELEASE
# 100e06f0b650601

docker system
docker system df
docker system info
docker system prune -a
docker container run -p 5000:5000 -d -m 512m in28min/hello-world-java:0.0.1.RELEASE
# 95d5c833901750f2a
docker system events
docker top 95d5c833901750f2a
docker stats 95d5c833901750f2a
 
docker container stats 95d5c833901750f2a

docker stop 100e06f0b650

docker build -t in28min/hello-world-python:0.0.2.RELEASE ./projects/hello-world/hello-world-python
docker run -p 5000:5000 -d in28min/hello-world-python:0.0.2.RELEASE
# 6eb6902082db6d71239
docker history 6eb6902082db6d71239
docker stop 6eb6902082db6d71239

export "$(grep -vE "^(#.*|\s*)$" .env)"
docker build -t in28min/hello-world-python:0.0.2.RELEASE ./projects/hello-world/hello-world-python
docker build -t "$DOCKERHUB_USERNAME"/hello-world-python:0.0.1.RELEASE ./projects/hello-world/hello-world-python
docker login
docker push "$DOCKERHUB_USERNAME"/hello-world-python:0.0.1.RELEASE

docker build -t "$DOCKERHUB_USERNAME"/hello-world-python:0.0.2.RELEASE ./projects/hello-world/hello-world-python
docker push "$DOCKERHUB_USERNAME"/hello-world-python:0.0.2.RELEASE

docker build -t "$DOCKERHUB_USERNAME"/hello-world-nodejs:0.0.1.RELEASE ./projects/hello-world/hello-world-nodejs
docker push "$DOCKERHUB_USERNAME"/hello-world-nodejs:0.0.1.RELEASE

docker build -t "$DOCKERHUB_USERNAME"/hello-world-nodejs:0.0.1.RELEASE ./projects/hello-world/hello-world-java
docker push "$DOCKERHUB_USERNAME"/hello-world-java:0.0.1.RELEASE

docker run -d -p 5001:5000 in28min/hello-world-nodejs:0.0.3.RELEASE ping google.com

docker pull in28min/currency-exchange:0.0.1-RELEASE
docker run -p 8000:8000 --name=currency-exchange in28min/currency-exchange:0.0.1-RELEASE

docker container stop currency-exchange
docker container rm currency-exchange

docker run -d -p 8000:8000 --name=currency-exchange in28min/currency-exchange:0.0.1-RELEASE
# f2c8c89373c2b16590544690a9202fbec94eec3f9976b8b28cba107fae9caeba

docker run -d -p 8100:8100 --name=currency-conversion in28min/currency-conversion:0.0.1-RELEASE
# 1154b2477240c63677989a7662d3e4f3eaa616e56c50dbd203bf8de5ba2534e9

docker network ls
docker network inspect bridge

# shortcut for now, not best way
docker container stop currency-conversion
docker container rm currency-conversion
docker container ls -a

docker run -d -p 8100:8100 \
--env CURRENCY_EXCHANGE_SERVICE_HOST=http://currency-exchange \
--name=currency-conversion \
--link currency-exchange \
in28min/currency-conversion:0.0.1-RELEASE
# b23affd87b0b3b828bdb5733fcffc450c38bb4e9b58f068a4ca4fada8978067f

docker network ls
docker network create currency-network
# 6710c80b93b4d5c807cda31433676a10458f73857b0d12ac0ad853f41137ef83

docker container stop currency-exchange
docker container rm currency-exchange
docker container stop currency-conversion
docker container rm currency-conversion

docker run -d -p 8000:8000 \
--name=currency-exchange \
--network=currency-network \
in28min/currency-exchange:0.0.1-RELEASE
# 169bc54234de4b844a2184dea84b618710f11621ab7336e40e27e420e67d4f8e

docker run -d -p 8100:8100 \
--env CURRENCY_EXCHANGE_SERVICE_HOST=http://currency-exchange \
--name=currency-conversion \
--network=currency-network \
in28min/currency-conversion:0.0.1-RELEASE
# 85269c6f844391a8dde1a1e999e22aceba86bf586d39e142cbda409e1a09a53a

docker logs -f 169bc54234
docker logs -f 85269c6f84

docker container stop currency-exchange
docker container rm currency-exchange
docker container stop currency-conversion
docker container rm currency-conversion

docker-compose --version

docker-compose -f projects/microservices/docker-compose.yml up
docker-compose -f projects/microservices/docker-compose.yml up -d

docker container ls
docker network ls
docker network inspect microservices_currency-compose-network

docker-compose -f projects/microservices/docker-compose.yml down
docker container ls -a
docker system prune -a

docker-compose -f projects/microservices/docker-compose.yml events

docker-compose -f projects/microservices/docker-compose.yml config
docker-compose -f projects/microservices/docker-compose.yml images
docker-compose -f projects/microservices/docker-compose.yml ps
docker-compose -f projects/microservices/docker-compose.yml top