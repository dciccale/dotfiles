# dotfiles

Here are some of my dotfile configurations for git and vim.

## Installation

1 - Drop these dotfiles in your home directory just by doing:

```bash
git clone https://github.com/dciccale/dotfiles.git ~/
```


2 - Install Vundle for plugin management:

```bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```


3 - Open vim and run the following command to install all the used plugins:

```
:BundleInstall
```

### Plugin updates

Each time you want to update any plugin, vundle does it for you, just run this command in vim:

```
:BundleUpdate
```

