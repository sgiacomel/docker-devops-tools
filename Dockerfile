FROM debian:stretch

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        git \
        wget \
        unzip \
        putty-tools \
        build-essential \
        python3-minimal \
        python3-setuptools \
        python3-dev \
        ca-certificates && \
    easy_install3 pip && \
    pip3 install --upgrade pip && \
    pip3 install 'ansible>=2.7,<2.8' netaddr boto3 boto dnsimple pyOpenSSL awscli && \
    pip3 install git+https://github.com/ansible/molecule.git@2.20.1 && \
    cd $TMPDIR && \
    wget --quiet https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && \
    unzip terraform_0.11.14_linux_amd64.zip && \
    mv ./terraform /usr/local/bin/ && \
    rm terraform_0.11.14_linux_amd64.zip && \
    wget --quiet https://releases.hashicorp.com/packer/1.3.5/packer_1.3.5_linux_amd64.zip && \
    unzip packer_1.3.5_linux_amd64.zip && \
    mv ./packer /usr/local/bin/ && \
    rm packer_1.3.5_linux_amd64.zip

ADD weakref.patch /tmp/weakref.patch

RUN patch /usr/lib/python3.5/weakref.py < /tmp/weakref.patch 
