**Configuración Automática de la Terminal de Ubuntu 🚀**

Este script configura y personaliza automáticamente tu terminal de Ubuntu con herramientas esenciales para un desarrollador backend, incluyendo la instalación de `zsh`, `Oh My Zsh`, `Docker`, y varias herramientas útiles para Git.

**Características ✨**

- Instala y configura `zsh` como la shell predeterminada. 🖥️
- Instala `Oh My Zsh` con el tema `Powerlevel10k` y varios plugins útiles como `zsh-autosuggestions`, `zsh-syntax-highlighting`, `zsh-completions`, y más. 🎨
- Añade alias y funciones personalizadas para `ls`, `grep`, `docker`, y comandos de Git. 🔧
- Instala herramientas adicionales como `htop`, `tree`, `bat`, `exa`, `fzf`, `tig`, `git-lfs`, `delta`, y `git-extras`. 🛠️

**Requisitos 📝**

- Ubuntu 20.04 o superior.
- Permisos de `sudo` para instalar paquetes y cambiar la shell predeterminada.

**Instrucciones de Uso 🏃‍♂️**

*Opción 1: Ejecutar directamente con `curl`*

Puedes ejecutar todo el proceso directamente desde tu terminal usando `curl`:

```less
bash <(curl -fsSL https://raw.githubusercontent.com/JahazielHernandezHoyos/initial-system-config-ubuntu/main/install_zsh.sh)

```

*Opción 2: Clonar y ejecutar manualmente*

1. Clona este repositorio:
    
    ```bash
    git clone https://github.com/JahazielHernandezHoyos/initial-system-config-ubuntu.git
    cd initial-system-config-ubuntu
    
    ```
    
2. Haz que el script sea ejecutable:
    
    ```bash
    chmod +x install_zsh.sh
    
    ```
    
3. Ejecuta el script:
    
    ```bash
    ./install_zsh.sh
    
    ```
    

**¿Qué hace el script? 🤔**

- **Instala dependencias**: `zsh`, `git`, `curl`, `docker`, `docker-compose`, entre otros. 📦
- **Cambia la shell predeterminada** a `zsh`. 🔄
- **Instala Oh My Zsh**: Incluyendo el tema `Powerlevel10k`. 🎨
- **Añade plugins útiles**: Como autocompletado, sugerencias de alias, y resaltado de sintaxis. 🛠️
- **Configura alias y funciones**: Para simplificar comandos frecuentes, especialmente relacionados con `docker` y `git`. 💡

**Herramientas Adicionales para Git 🧩**

El script incluye herramientas avanzadas para manejar Git de manera más eficiente:

- **tig**: Visualizador de repositorios Git. 👁️
- **git-lfs**: Soporte para archivos grandes en Git. 🗃️
- **delta**: Mejor visualización de `git diff`. 🎨
- **git-extras**: Comandos adicionales para Git. 📈

**Alias y Funciones para Git 🔍**

El script también añade varios alias y funciones útiles:

- **Alias**: Simplificación de comandos como `gco` para `git checkout`, `gpo` para `git push origin`, y más. 🚀
- **Fuzzy Finder**:
    - **fbr**: Cambia entre ramas utilizando `fzf`. 🌿
    - **fgaa**: Añade archivos a Git usando `fzf` para seleccionar múltiples archivos. 📂

**Post-Instalación 🛠️**

Después de ejecutar el script, cierra y vuelve a abrir tu terminal para aplicar todos los cambios. Si deseas personalizar más tu configuración, puedes editar el archivo `~/.zshrc`.

**Contribuciones 🤝**

Si deseas mejorar o añadir más funcionalidades al script, eres bienvenido a hacer un fork del repositorio y enviar un pull request.