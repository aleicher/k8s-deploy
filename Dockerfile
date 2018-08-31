FROM google/cloud-sdk:214.0.0
LABEL maintainer="Andreas Leicher <email@andreasleicher.com>"

# install pip
RUN apt-get update && apt-get install -y --no-install-recommends build-essential python-pip git && rm -rf /var/lib/apt/lists/*

ENV SOPS_VERSION="3.0.4"
ENV KUBEVAL_VERSION="0.7.3"

# install sops
RUN curl -LO https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops_${SOPS_VERSION}_amd64.deb && \
    dpkg -i sops_${SOPS_VERSION}_amd64.deb

# install kubeval
RUN curl -LO https://github.com/garethr/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz && \
    tar -xzvf kubeval-linux-amd64.tar.gz && \
    mv kubeval /usr/local/bin


# install requirements
COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt
