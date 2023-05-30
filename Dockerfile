FROM anibali/pytorch:1.5.0-cuda10.2-ubuntu18.04

WORKDIR /improved-ddpm
COPY setup.py .
RUN pip install -e .