# Start with Ubuntu base image
FROM halo9pan/ubuntu
MAINTAINER Halo9Pan <halo9pan@gmail.com>

# CUDA version - as the kernel is shared the host and container must correspond
ENV NVIDIA_VERSION=352.41 CUDA_MAJOR=7.0 CUDA_VERSION=7.0.28 CUDA_PATH=/opt/CUDA

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  linux-headers-generic linux-image-generic \
  build-essential bash-completion wget

# Install NVIDIA driver (silent, no kernel)
RUN cd /tmp &&\
  wget http://http.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_VERSION}/NVIDIA-Linux-x86_64-${NVIDIA_VERSION}.run && \
  chmod +x NVIDIA-Linux-x86_64-*.run && ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module && \
  rm -rf *

# Install CUDA toolkit
RUN cd /tmp && \
# Download run file
  wget http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_${CUDA_VERSION}_linux.run && \
# Install CUDA toolkit
  chmod +x cuda_*_linux.run && ./cuda_*_linux.run --silent --toolkit --toolkitpath=${CUDA_PATH} && \
# Make the run file executable and extract
# chmod +x cuda_*_linux.run && ./cuda_*_linux.run -extract=`pwd` && \
# Install toolkit (silent)  
# ./cuda-linux64-rel-*.run -noprompt && \
# Clean up
  rm -rf *

# Add to path
ENV PATH ${CUDA_PATH}/bin:${PATH}
# Configure dynamic link
RUN echo "${CUDA_PATH}/lib64" >> /etc/ld.so.conf && ldconfig

