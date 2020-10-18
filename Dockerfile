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
	zlib1g-dev

COPY .bashrc /root/.bashrc
COPY .vimrc /root/.vimrc

# Norminette
RUN apt-get install -y ruby ruby-bundler ruby-dev
RUN git clone https://github.com/hivehelsinki/norminette-client.git ~/.norminette/
RUN cd ~/.norminette && bundle
RUN echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.bashrc
COPY entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

# TODO: add ssh key
# RUN mkdir /root/.ssh/

# Authorize SSH Host
# RUN mkdir -p /root/.ssh && \
#     chmod 0700 /root/.ssh && \
#     ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
# RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
#     echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
#     chmod 600 /root/.ssh/id_rsa && \
#     chmod 600 /root/.ssh/id_rsa.pub

# Enable ssh
# RUN mkdir /var/run/sshd
# RUN echo 'root:root' | chpasswd
# RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# create volume
# RUN mkdir -p /root/42reviews
# VOLUME /root/42reviews

# launch
# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]

# Default command
#CMD ["/bin/bash", "/tmp/entrypoint.sh"]
ENTRYPOINT ["tmp/entrypoint.sh"]
CMD ["/bin/bash"]
#ENTRYPOINT "/tmp/entrypoint.sh && /bin/bash"
