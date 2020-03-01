FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD ./sources.list /etc/apt/sources.list 
RUN apt-get -y update 
RUN apt-get -y install wget curl make gcc wget gcc-c++ git \
	 python3-pip python3-dev python3

RUN mkdir /data 
WORKDOR /data

RUN git clone https://github.com/xx-life/Bilibili_video_download && \
  cd Bilibili_video_download && pip3 install -r requirements.txt 

# RUN wget https://github.com/imageio/imageio-binaries/raw/master/ffmpeg/ffmpeg.linux64



