FROM google/cloud-sdk:214.0.0
LABEL maintainer="Andreas Leicher <email@andreasleicher.com>"

# install pip
RUN apt-get update && apt-get install -y --no-install-recommends python-pip git && rm -rf /var/lib/apt/lists/*

ENV SOPS_VERSION="3.0.4"

# install sops
RUN curl -LO https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops_${SOPS_VERSION}_amd64.deb && \
    dpkg -i sops_${SOPS_VERSION}_amd64.deb

# install requirements
COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt
