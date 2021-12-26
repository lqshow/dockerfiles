#!/bin/bash
echo 'Bootstrap steps start here:'

echo '[STEP 1] Installing k9s awesomeness'
(
  set -x &&
  wget -c https://github.com/derailed/k9s/releases/download/v0.13.4/k9s_0.13.4_Linux_x86_64.tar.gz -O - | tar -xz &&
  chmod +x k9s &&
  mv k9s /usr/local/bin/
)

echo '[STEP 2] Installing Oh-My-Zsh'
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo '[STEP 3] Installing zsh-autosuggestions plugin'
git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions


echo '[STEP 4] Installing Okteto for local development'
curl https://get.okteto.com -sSfL | sh

echo '[STEP 5] Install tmux with cool customizations'
git clone https://github.com/samoshkin/tmux-config.git
./tmux-config/install.sh

echo '[STEP 6] Setting zsh as default shell'
chsh -s $(which zsh)
