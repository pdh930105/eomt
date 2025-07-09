FROM nvcr.io/nvidia/pytorch:25.02-py3 as base

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get clean
# this line change to ubuntu archive
RUN apt-get update 
RUN apt-get install vim -y
RUN apt-get install tmux -y
RUN apt-get install sudo -y

RUN pip install transformers
RUN pip install datasets
# user setting
ARG USER_ID
ARG GROUP_ID
ARG USER_NAME

RUN addgroup --gid $GROUP_ID $USER_NAME
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER_NAME
RUN echo "$USER_NAME:$USER_NAME"|chpasswd
RUN adduser $USER_NAME sudo
RUN echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

