FROM pytorch/pytorch:1.0-cuda10.0-cudnn7-devel

RUN conda install cython cffi opencv-python scipy msgpack easydict matplotlib pyyaml tensorboardX torchvision
