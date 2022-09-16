FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-devel

RUN pip install cython cffi scipy msgpack matplotlib pyyaml tensorboardX torchvision opencv-python easydict


