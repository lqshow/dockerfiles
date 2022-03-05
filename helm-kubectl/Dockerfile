FROM alpine:3.10

# Install kubectl

ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

# Note: Latest version of helm may be found at
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v3.3.4"

RUN apk add --no-cache ca-certificates bash tzdata make git openssh protobuf curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && chmod +x /usr/local/bin/helm \
    && chmod g+rwx /root \
    && mkdir /config \
    && chmod g+rwx /config \
    && apk -U add findutils

CMD ["/bin/bash"]
