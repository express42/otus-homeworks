FROM ubuntu:16.04

LABEL version="0.7" maintainer="Express42"

ARG PACKER_VER=1.4.4
ARG TERRAFORM_VER=0.12.8
ARG TFLINT_VER=0.11.2
ARG ANSIBLE_VER=2.6.0
ARG ANSLINT_VER=3.4.23
ARG DOCKERVERSION=18.03.0-ce
ARG DOCKERCOMPOSE_VER=1.21.0
ARG INSPEC_VER=4.17.17

RUN apt-get update && \
    apt-get install -y unzip curl python3 netcat openvpn openssh-server git sudo python-pip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd && \
    mkdir /root/.ssh
# RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd appuser -m -G sudo

COPY id_rsa_test.pub /root/.ssh/authorized_keys


# Install InSpec
RUN cd /tmp && \
    curl -O https://packages.chef.io/files/stable/inspec/${INSPEC_VER}/ubuntu/16.04/inspec_${INSPEC_VER}-1_amd64.deb && \
    apt-get install -f /tmp/inspec_${INSPEC_VER}-1_amd64.deb && \
    inspec exec --chef-license accept

# Install Packer
RUN cd /tmp && \
    curl -O https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip && \
    unzip packer_${PACKER_VER}_linux_amd64.zip && \
    rm /tmp/packer_${PACKER_VER}_linux_amd64.zip && \
    mv /tmp/packer /usr/bin && \
    chmod +x /usr/bin/packer

# Install terraform & terraform-lint
RUN cd /tmp && \
    curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    rm /tmp/terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    mv /tmp/terraform /usr/bin && \
    chmod +x /usr/bin/terraform &&\
    curl -OL https://github.com/wata727/tflint/releases/download/v${TFLINT_VER}/tflint_linux_amd64.zip && \
    unzip tflint_linux_amd64.zip && \
    rm /tmp/tflint_linux_amd64.zip && \
    mv /tmp/tflint /usr/bin && \
    chmod +x /usr/bin/tflint

# Install docker client
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
    && mv docker-${DOCKERVERSION}.tgz docker.tgz \
    && tar xzvf docker.tgz \
    && mv docker/docker /usr/local/bin \
    && rm -r docker docker.tgz

# Install ansible & ansible-lint
RUN pip install ansible==${ANSIBLE_VER} ansible-lint==${ANSLINT_VER} docker-compose==${DOCKERCOMPOSE_VER}

WORKDIR /srv
VOLUME /srv
EXPOSE 22

CMD ["/sbin/init"]
