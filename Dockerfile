FROM ubuntu:16.04

ARG PACKER_VER=1.2.1
ARG TERRAFORM_VER=0.11.5
ARG TFLINT_VER=0.5.4
ARG ANSIBLE_VER=2.4.3
ARG ANSLINT_VER=3.4.21

RUN apt-get update && \
    apt-get install -y unzip curl python3 netcat openvpn openssh-server git sudo python-pip && \
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

# Install ansible & ansible-lint
RUN pip install ansible==${ANSIBLE_VER} ansible-lint==${ANSLINT_VER}

WORKDIR /srv
VOLUME /srv
EXPOSE 22

CMD ["/sbin/init"]
