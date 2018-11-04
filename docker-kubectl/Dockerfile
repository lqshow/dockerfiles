FROM alpine

# Install kubectl

ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

RUN apk add --no-cache bash tzdata curl ca-certificates \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone

CMD ["/bin/bash"]