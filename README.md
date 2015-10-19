# docker-cuda
Dockfile for build CUDA

## Build image
docker build -t halo9pan/cuda .

## Create container
docker create -t -i --name=cuda --hostname=ubuntu-cuda -v ~/NVIDIA_CUDA-7.5_Samples:/samples --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia0:/dev/nvidia0 halo9pan/cuda bash

## Start container
docker start -a -i cuda
