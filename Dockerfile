FROM anibali/pytorch:1.5.0-cuda10.2-ubuntu18.04
USER root

RUN apt-get clean
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-get update
RUN apt-get install -y libopenmpi-dev
RUN pip install mpi4py

RUN mkdir -p /setup
WORKDIR /setup
COPY setup.py .
RUN pip install -e .