FROM debian:stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        git \
        build-essential \
        python-minimal \
        python-setuptools \
        python-dev \
        ca-certificates && \
    easy_install pip && \
    pip install --upgrade pip && \
    pip install ansible boto3 boto dnsimple && \
    pip install git+https://github.com/metacloud/molecule.git@2.8.2
