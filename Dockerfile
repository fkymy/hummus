FROM ubuntu:focal

# set environment variables for timezone
ARG TZ=Asia/Tokyo
ENV TZ ${TZ}

# include man pages and documentations
RUN apt-get update && yes | unminimize

# install essential development programs
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		bc \
		curl \
		dc \
		emacs-nox \
		git \
		git-doc \
		man \
		micro \
		nano \
		sudo \
		valgrind \
		vim \
		wget

# install gcc related packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		binutils-doc \
		cpp-doc \
		gcc-doc \
		g++ \
		g++-multilib \
		gdb \
		gdb-doc \
		glibc-doc \
		libblas-dev \
		liblapack-dev \
		liblapack-doc \
		libstdc++-10-doc \
		make \
		make-doc

# install clang related packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		clang \
		clang-10-doc \
		lldb

# install assembly related programs
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		nasm

# install qemu
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		qemu-system-x86

# install system exploration programs
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		blktrace \
		linux-tools-generic \
		strace \
		tcpdump

# install networking programs
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		dnsutils \
		inetutils-ping \
		net-tools \
		netcat \
		telnet \
		traceroute

# set up libraries
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		libreadline-dev \
		locales \
		wamerican

# set up norminette
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
		python2 \
		python3 \
		python3-pip

WORKDIR /usr/src/norminette

RUN git clone --depth 1 https://github.com/42School/norminette . && \
	pip3 install -r requirements.txt && \
	python3 setup.py install

# remove unnecessary .deb files
RUN rm -r /var/lib/apt/lists/*

# set up default locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# set up passwordless sudo for user hummus
RUN useradd -m -s /bin/bash hummus-user && \
    echo "hummus-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/hummus-init

# git build arguments
ARG USER=hummus
ARG EMAIL=hummus@example.com

# configurations
USER hummus-user
RUN git config --global user.name "${USER}" && \
	git config --global user.email "${EMAIL}" && \
    (echo "set expandtab"; echo "set shiftwidth=4"; echo "set softtabstop=4") > ~/.vimrc && \
    echo "add-auto-load-safe-path ~" > ~/.gdbinit

# COPY dotfiles/.bashrc /root/.bashrc
# COPY dotfiles/.vimrc /root/.vimrc

WORKDIR /home/hummus-user

# CMD ["/bin/bash"]
