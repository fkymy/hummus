FROM ubuntu:20.04

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
	build-essential \
	curl \
	git \
	valgrind \
	vim \
	openssh-server \
	xorg \
	libxext-dev \
	zlib1g-dev \
	strace \
	nasm \
	python2 \
	python3 \
	python3-pip

COPY dotfiles/.bashrc /root/.bashrc
COPY dotfiles/.vimrc /root/.vimrc

WORKDIR /usr/src/norminette

RUN git clone --depth 1 https://github.com/42School/norminette . && \
	pip3 install -r requirements.txt && \
	python3 setup.py install

WORKDIR /root/project

CMD ["/bin/bash"]
