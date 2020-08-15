FROM ubuntu:16.04

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	build-essential \
	curl \
	git \
	valgrind \
	vim \
	xorg \
	libxext-dev \
	zlib1g-dev

# Norminette
RUN apt-get install -y ruby ruby-bundler ruby-dev
RUN git clone https://github.com/hivehelsinki/norminette-client.git ~/.norminette/
RUN cd ~/.norminette && bundle
RUN echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.bashrc

# ssh key
RUN mkdir /root/.ssh/
# TODO: add key

# Enable ssh
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# create volume
# RUN mkdir -p /root/42reviews
# VOLUME /root/42reviews

# launch
# CMD /usr/sbin/sshd -D
# EXPOSE 22

CMD /bin/bash
