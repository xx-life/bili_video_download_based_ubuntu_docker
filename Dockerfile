FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV BILI_AV_NUM=

ADD ./sources.list /etc/apt/sources.list 
RUN apt-get -y update 
RUN apt-get -y install wget curl make gcc wget gcc-c++ git \
	 python3-pip python3-dev python3

RUN mkdir /data 
WORKDOR /data
ADD . /data 

RUN mkdir /root/.imageio/ffmpeg && \
	cd /root/.imageio/ffmpge && \
	wget https://github.com/imageio/imageio-binaries/raw/master/ffmpeg/ffmpeg.linux64

RUN pip3 install moviepy==0.2.3.2 requests==2.18.4 -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD ['python3', 'download_bili_vedio_by_num.py']
