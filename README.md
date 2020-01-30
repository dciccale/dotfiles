# dotfiles

Here are some of my dotfile configurations for git and vim.

## Installation

Drop these dotfiles in your home directory just by doing:

```bash
$ git clone https://github.com/dciccale/dotfiles.git ~/
```

## Vim plugins installation

1 - Install Vundle for plugin management:

```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```


2 - Open vim and run the following command to install the plugins used:

```
:PlugInstall
```

Or if using my mappings just type `,bi`.

### Plugin updates

Each time you want to update any plugin, vundle does it for you, just run this command in vim:

```
:PlugUpdate
```

Or if keeping my mappings just do `,bu`.

cheers.

