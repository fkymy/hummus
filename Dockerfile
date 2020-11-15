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
	strace \
	ruby \
	ruby-bundler \
	ruby-dev

COPY .bashrc /root/.bashrc
COPY .vimrc /root/.vimrc

RUN git clone https://github.com/hivehelsinki/norminette-client.git ~/.norminette/ && \
	cd ~/.norminette && bundle && \
	echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.bashrc

COPY entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["tmp/entrypoint.sh"]
CMD ["/bin/bash"]
