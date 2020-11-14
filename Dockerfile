FROM ubuntu:16.04

ENV CH_NORM_HOSTNAME=yes

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
	strace

COPY .bashrc /root/.bashrc
COPY .vimrc /root/.vimrc

RUN apt-get install -y ruby ruby-bundler ruby-dev
RUN git clone https://github.com/hivehelsinki/norminette-client.git ~/.norminette/
RUN cd ~/.norminette && bundle
RUN echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.bashrc
COPY entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["tmp/entrypoint.sh"]
CMD ["/bin/bash"]
