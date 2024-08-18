#!/bin/bash

# Función para manejar errores
handle_error() {
    echo "Error: $1"
    exit 1
}

# Actualizar e instalar dependencias necesarias
echo "Actualizando el sistema e instalando dependencias..."
sudo apt update || handle_error "No se pudo actualizar el sistema."
sudo apt install -y \
    zsh \
    git \
    curl \
    wget \
    build-essential \
    btop \ 
    tree \
    fzf \
    bat \
    eza \ 
    lsd || handle_error "No se pudieron instalar algunas dependencias."

# Verificar si el directorio de Oh My Zsh ya existe
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "El directorio $HOME/.oh-my-zsh ya existe. Si deseas reinstalar, elimínalo primero."
else
    # Instalar Oh My Zsh sin interacción
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || handle_error "No se pudo instalar Oh My Zsh."
fi

# Verificar si el tema Powerlevel10k ya está instalado
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    # Instalar Powerlevel10k (un tema popular para Zsh)
    echo "Instalando Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k || handle_error "No se pudo clonar Powerlevel10k."
else
    echo "El tema Powerlevel10k ya está instalado."
fi

# Crear un archivo .zshrc predeterminado
echo "Configurando .zshrc..."
cat <<EOL > ~/.zshrc
# Configuración de Zsh
ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins recomendados para Zsh
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting zsh-completions alias-tips)

# Alias útiles
alias ll='eza -lh --git' 
alias la='eza -a --git'
alias ls='eza --git'
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
    branches=\$(git branch -a | grep -v '/HEAD' | grep -v '\*' | sed 's/.* //g' | sort -u) &&
    branch=\$(echo "\$branches" | fzf +m) &&
    git checkout "\$branch"
}

# Fuzzy finder para añadir archivos a git
fgaa() {
    git add \$(git status -s | fzf -m --ansi)
}
EOL

# Cambiar la shell por defecto a zsh
chsh -s $(which zsh) || handle_error "No se pudo cambiar la shell por defecto a zsh."

# Recargar la configuración de Zsh
source ~/.zshrc

echo "Instalación completada. Reinicia tu terminal para ver los cambios."