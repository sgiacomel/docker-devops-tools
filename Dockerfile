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
    pip install 'ansible>=2.4,<2.5' boto3 boto dnsimple pyOpenSSL && \
    pip install git+https://github.com/metacloud/molecule.git@2.15 && \
    cd $TMPDIR && \
    wget --quiet https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && \
    unzip terraform_0.11.7_linux_amd64.zip && \
    mv ./terraform /usr/local/bin/ && \
    rm terraform_0.11.7_linux_amd64.zip
