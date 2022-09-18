FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel

RUN pip install  torchvision opencv-python pandas numpy matplotlib os pdb time shutil skimage PIL tadm albumentations


