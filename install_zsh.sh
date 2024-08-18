#!/bin/bash

# Actualizar e instalar dependencias necesarias
sudo apt update && sudo apt install -y \
    zsh \
    git \
    curl \
    wget \
    build-essential \
    htop \
    tree \
    # docker.io \
    # docker-compose \
    fzf \
    bat \
    exa \
    tig \
    git-lfs \
    delta \
    git-extras

# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cambiar la shell por defecto a zsh
chsh -s $(which zsh)

# Instalar Powerlevel10k (un tema popular para Zsh)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configurar .zshrc para usar Powerlevel10k
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Instalar plugins recomendados para Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt

# Añadir los plugins al archivo .zshrc
sed -i 's/plugins=(git)/plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting zsh-completions alias-tips)/g' ~/.zshrc

# Añadir alias útiles al archivo .zshrc
cat <<EOL >> ~/.zshrc

# Alias útiles
alias ll='exa -lh --git'
alias la='exa -a --git'
alias ls='exa --git'
alias cat='bat'
alias ..="cd .."
alias ...="cd ../.."
alias grep='grep --color=auto'

# Docker alias
alias d='docker'
alias dc='docker-compose'

# Función para limpiar contenedores, volúmenes y redes no utilizados
docker-cleanup() {
  docker system prune -af --volumes
}

# Git alias
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gco='git checkout'
alias gpo='git push origin'
alias gst='git status'
alias glg='git log --oneline --graph --decorate --all'
alias gdf='git diff | delta'
alias grb='git rebase'
alias gmt='git mergetool'
alias gtig='tig'

# Fuzzy finder para cambiar ramas de Git
fbr() {
    local branches branch
    branches=$(git branch -a | grep -v '/HEAD' | grep -v '\*' | sed 's/.* //g' | sort -u) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout "$branch"
}

# Fuzzy finder para añadir archivos a git
fgaa() {
    git add $(git status -s | fzf -m --ansi)
}
EOL

# Recargar la configuración de Zsh
source ~/.zshrc

echo "Instalación completada. Reinicia tu terminal para ver los cambios."
