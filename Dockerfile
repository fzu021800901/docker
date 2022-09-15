FROM pytorch/pytorch:1.0.1-cuda10.0-cudnn7-devel

RUN pip install cython cffi opencv-python scipy msgpack easydict matplotlib pyyaml tensorboardX
