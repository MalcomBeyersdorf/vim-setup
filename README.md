# Mi configuracion de vim
Copiar el contenido del archido .vimrc dentro del directorio

> Funciona tanto para vim como para nvim. Solo cambiar ubicacion y nombre del rc

VIM: ~/.vimrc
NVIM: ~/.config/nvim/init.vim 

## Paso a paso
> Dentro de los links hay que seguir todos los pasos de instalacion

1. Instalar emulador/terminal [Windows](https://awesomeopensource.com/project/felixse/FluentTerminal) [MacOS](https://iterm2.com)
2. Instalar [OhMyZsh](https://github.com/ohmyzsh/ohmyzsh)
3. Setear gruvbox como tema para [OhMyZsh](https://github.com/sbugzu/gruvbox-zsh)
4. Instalar [Vim-Plug](https://github.com/junegunn/vim-plug)
5. Dentro de .vimrc o init.vim correr :PlugInstall para instalar los plugins de 3ros y despues correr :CocInstall con los plugins necesarios Ej: ":CocInstall coc-json coc-css"
6. Correr :GoInstallBinaries (para que funcione el plugin vim-go) 

## Explicacion de las configuraciones y los atajos
- Proximamente estare detallando accesos rapidos propios y accesos rapidos de cada plugin instalado
