FROM google/cloud-sdk
MAINTAINER Andreas Leicher <email@andreasleicher.com>

# install pip
RUN apt-get update && apt-get install -y python-pip git

ENV SOPS_VERSION="3.0.5"

# install sops
RUN curl -LO https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops_${SOPS_VERSION}_amd64.deb && \
    dpkg -i sops_${SOPS_VERSION}_amd64.deb

# install requirements
COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt
