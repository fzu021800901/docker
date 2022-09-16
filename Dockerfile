FROM pytorch/pytorch:1.0-cuda10.0-cudnn7-devel

RUN conda install cython cffi scipy msgpack matplotlib pyyaml tensorboardX torchvision

RUN pip install opencv-python easydict
