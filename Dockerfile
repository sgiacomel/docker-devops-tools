FROM debian:stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        git \
        wget \
        unzip \
        putty-tools \
        build-essential \
        python-minimal \
        python-setuptools \
        python-dev \
        ca-certificates && \
    easy_install pip && \
    pip install --upgrade pip && \
    pip install 'ansible>=2.7,<2.8' boto3 boto dnsimple pyOpenSSL awscli && \
    pip install git+https://github.com/ansible/molecule.git@2.19 && \
    cd $TMPDIR && \
    wget --quiet https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip && \
    unzip terraform_0.11.11_linux_amd64.zip && \
    mv ./terraform /usr/local/bin/ && \
    rm terraform_0.11.11_linux_amd64.zip && \
    wget --quiet https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip && \
    unzip packer_1.3.3_linux_amd64.zip && \
    mv ./packer /usr/local/bin/ && \
    rm packer_1.3.2_linux_amd64.zip
