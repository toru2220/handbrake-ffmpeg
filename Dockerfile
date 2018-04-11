FROM	ubuntu:16.04

ENV     DEBIAN_FRONTEND noninteractive

RUN 	echo 'deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu xenial main' > /etc/apt/sources.list.d/handbrake.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8771ADB0816950D8 && \
	apt-get update && \
	apt-get -y --no-install-recommends install software-properties-common handbrake-cli && \
	add-apt-repository ppa:jonathonf/ffmpeg-3 && \
	apt-get -y --no-install-recommends install ffmpeg libav-tools x264 x265 lsdvd &&\
	apt-get clean

WORKDIR /data
VOLUME ["/data"]


