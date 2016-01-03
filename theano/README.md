# docker-theano
Dockfile for build CUDA bases Theano

## Build image
docker build -t halo9pan/cuda-theano .

## Create container
docker create -t -i --name=theano --hostname=ubuntu -v ~/Work:/work --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidia-uvm:/dev/nvidia-uvm halo9pan/cuda-theano bash

## Start container
docker start -a -i theano
docker exec -t -i theano bash


