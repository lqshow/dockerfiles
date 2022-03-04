#!/bin/bash

echo '[STEP 1] Creating directory for kubectl config'
mkdir /root/.kube

echo '[STEP 2] Installing Krew'
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

echo '[STEP 3] Installing kubectx and kubens - quickly switch kubernetes context and namespace'
(
  git clone https://github.com/ahmetb/kubectx /opt/kubectx && \
  ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx && \
  ln -s /opt/kubectx/kubens /usr/local/bin/kubens
)

echo '[STEP 4] Installing stern'
(
    wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 && \
    chmod +x stern_linux_amd64 && \
    mv stern_linux_amd64 /usr/local/bin/stern
)

echo '[STEP 5] Installing kubectl-images plugin'
(
    set -x &&
    wget -c https://github.com/chenjiandongx/kubectl-images/releases/download/v0.3.6/kubectl-images_linux_amd64.tar.gz -O - | tar -xz &&
    chmod +x kubectl-images &&
    mv kubectl-images /usr/local/bin/
)

echo '[STEP 6] IInstalling kubectl-neat plugin'
(
    set -x &&
    wget -c https://github.com/itaysk/kubectl-neat/releases/download/v2.0.3/kubectl-neat_linux_amd64.tar.gz  -O - | tar -xz &&
    chmod +x kubectl-neat &&
    mv kubectl-neat /usr/local/bin/
)

echo '[STEP 7] IInstalling kubectl-iexec plugin'
(
    # Get latest release
    TAG=$(curl -s https://api.github.com/repos/gabeduke/kubectl-iexec/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

    # Donwload and extract binary to /usr/local/bin
    wget -c  https://github.com/gabeduke/kubectl-iexec/releases/download/${TAG}/kubectl-iexec_${TAG}_${OS:-Linux}_x86_64.tar.gz -O - | tar -xz &&
    chmod +x kubectl-iexec &&
    mv kubectl-iexec /usr/local/bin/
)

echo '[STEP 8] IInstalling kubectl-sniff plugin'
(
    kubectl krew install sniff
)