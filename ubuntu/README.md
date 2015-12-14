# docker-ubuntu
Basic Ubuntu Dockerfile for my images.

## Build image
docker build -t halo9pan/ubuntu .

## Create container
docker create -t -i --name=ubuntu --hostname=ubuntu halo9pan/ubuntu

## Start container
docker start -a -i ubuntu
