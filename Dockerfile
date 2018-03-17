FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y unzip curl python3 netcat openvpn openssh-server git sudo && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd && \
    mkdir /root/.ssh
# RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd appuser -m -G sudo

COPY id_rsa_test.pub /root/.ssh/authorized_keys

# Install InSpec
RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec

# Install Packer
RUN cd /tmp && \
    curl  -O https://releases.hashicorp.com/packer/1.2.1/packer_1.2.1_linux_amd64.zip && \
    unzip packer_1.2.1_linux_amd64.zip && \
    rm /tmp/packer_1.2.1_linux_amd64.zip && \
    mv /tmp/packer /usr/bin && \
    chmod +x /usr/bin/packer

WORKDIR /srv
VOLUME /srv
EXPOSE 22

CMD ["/sbin/init"]
