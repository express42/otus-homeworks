FROM ubuntu:16.04

RUN apt-get update && apt-get install unzip curl screen -y

# Install InSpec
RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec

# Install Packer
ADD https://releases.hashicorp.com/packer/1.2.1/packer_1.2.1_linux_amd64.zip /tmp/
RUN cd /tmp/ && unzip packer_1.2.1_linux_amd64.zip
RUN mv /tmp/packer /usr/bin && chmod +x /usr/bin/packer

WORKDIR /srv
VOLUME /srv

CMD ["/bin/bash"]
