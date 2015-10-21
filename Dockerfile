# Start with Ubuntu base image
FROM halo9pan/ubuntu
MAINTAINER Halo9Pan <halo9pan@gmail.com>

# CUDA version - as the kernel is shared the host and container must correspond
RUN export NVIDIA_VERSION=355.11 \
  CUDA_MAJOR=7.5 \
  CUDA_VERSION=7.5.18 \
  CUDA_PATH=/opt/CUDA \

RUN apt-get install -y \
  linux-headers-generic linux-image-generic \
  build-essential bash-completion wget

# Install NVIDIA driver (silent, no kernel)
RUN cd /tmp &&\
  wget http://http.download.nvidia.com/XFree86/Linux-x86_64/355.11/NVIDIA-Linux-x86_64-355.11.run &&\
  chmod +x NVIDIA-Linux-x86_64-*.run && ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module &&\
  rm -rf *

# Install CUDA toolkit
RUN cd /tmp && \
# Download run file
  wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run && \
# Install CUDA toolkit
  chmod +x cuda_*_linux.run && ./cuda_*_linux.run --silent --toolkit --toolkitpath=/opt/CUDA && \
# Make the run file executable and extract
# chmod +x cuda_*_linux.run && ./cuda_*_linux.run -extract=`pwd` && \
# Install toolkit (silent)  
# ./cuda-linux64-rel-*.run -noprompt && \
# Clean up
  rm -rf *

# Add to path
ENV PATH /opt/CUDA/bin:${PATH}
# Configure dynamic link
RUN echo "/opt/CUDA/lib64" >> /etc/ld.so.conf && ldconfig

