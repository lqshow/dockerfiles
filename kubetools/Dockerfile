FROM ubuntu:impish-20211102

ARG BUILD_DATE

# Metadata
LABEL org.label-schema.name="Kubetools" \
      org.label-schema.build-date=$BUILD_DATE

WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive
ENV KUBE_PS1_SYMBOL_DEFAULT K

RUN apt-get update && apt-get -y install --no-install-recommends \
    gnupg \
    curl \
    wget \
    git \
    apt-transport-https \
    ca-certificates \
    zsh \
    iptables \
    tmux \
    fzf \
    vim \
    net-tools \
    dnsutils \
    iputils-ping \
    unzip \

    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV SHELL /usr/bin/zsh

# Install kubectl
# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
ARG KUBE_LATEST_VERSION="v1.19.2"
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/bin/kubectl

# Install helm
# Note: Latest version of helm may be found at
# https://github.com/kubernetes/helm/releases
ARG HELM_VERSION="v3.7.2"
RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

# Install telepresence
RUN curl -fL https://app.getambassador.io/download/tel2/linux/amd64/latest/telepresence -o /usr/local/bin/telepresence && chmod a+x /usr/local/bin/telepresence

# Bootstrap
COPY bootstrap.sh ./
RUN chmod +x bootstrap.sh && ./bootstrap.sh

# kubectl plugin
COPY krew_plugin.sh ./
RUN chmod +x krew_plugin.sh && ./krew_plugin.sh

COPY .zshrc ./
RUN exec zsh

CMD [""]