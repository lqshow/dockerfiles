FROM alpine:3.10

# Install kubectl

ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

RUN apk add --no-cache bash tzdata curl git make openssl protobuf ca-certificates \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh && chmod 700 ./get_helm.sh && ./get_helm.sh --version v2.10.0 \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone

RUN apk -U add findutils && helm init --client-only

CMD ["/bin/bash"]
