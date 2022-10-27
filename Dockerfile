FROM 1.6.0-cuda10.1-cudnn7-devel

RUN pip install --upgrade pip \
    && pip install pycocotools \
    && pip install numpy==1.17 \
    && pip install torchvision \
    && pip install matplotlib \
    && pip install tqdm \
    && pip install pillow \
    && pip install tensorboard
