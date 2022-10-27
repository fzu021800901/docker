FROM nvidia/cuda:10.1-cudnn7-devel

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing && apt-get install -y git --fix-missing \
 python3-opencv ca-certificates python3-dev git wget sudo && \
  rm -rf /var/lib/apt/lists/*

# create a non-root user
ARG USER_ID=1000
RUN useradd -m --no-log-init --system  --uid ${USER_ID} leaf -g sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER leaf
WORKDIR /home/leaf

ENV PATH="/home/leaf/.local/bin:${PATH}"
RUN wget https://bootstrap.pypa.io/get-pip.py && \
 python3 get-pip.py --user && \
 rm get-pip.py

# install dependencies
# See https://pytorch.org/ for other options if you use a different version of CUDA
RUN pip install --user --upgrade pip
RUN pip3 install torch==1.3.1 torchvision==0.2.1 -i https://pypi.douban.com/simple
RUN pip3 install --user cython
RUN pip3 install --user 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'

RUN pip3 install --user 'git+https://github.com/facebookresearch/fvcore'
# install detectron2
RUN git clone https://github.com/facebookresearch/detectron2 detectron2_repo
ENV FORCE_CUDA="1"
# This will build detectron2 for all common cuda architectures and take a lot more time,
# because inside `docker build`, there is no way to tell which architecture will be used.
ENV TORCH_CUDA_ARCH_LIST="Kepler;Kepler+Tesla;Maxwell;Maxwell+Tegra;Pascal;Volta;Turing"
RUN pip install --user -e detectron2_repo

# Set a fixed model cache directory.
ENV FVCORE_CACHE="/tmp"
WORKDIR /home/leaf/detectron2_repo
