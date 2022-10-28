FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

RUN pip install --upgrade pip 
RUN pip install tqdm 
RUN pip install opencv-python
RUN pip install numpy==1.17
RUN pip install torchvision
RUN pip install pillow
RUN pip install matplotlib
RUN pip install pycocotools
RUN pip install tensorboard
# RUN apt-get update && apt-get install -y opencv-python-headless
RUN pip install opencv-python-headless
# RUN apt-get update
# RUN apt-get install ffmpeg libsm6 libxext6  -y


