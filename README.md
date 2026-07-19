# dotfiles

Personal macOS shell, Git, Neovim, Homebrew, and utility configuration.

## Installation

Clone the repository into the projects directory:

```bash
git clone git@github.com:dciccale/dotfiles.git ~/git/dotfiles
```

Back up any existing configuration first, then link the tracked files:

```bash
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.zimrc ~/.zimrc
ln -s ~/git/dotfiles/.zsh_aliases ~/.zsh_aliases
ln -s ~/git/dotfiles/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/Brewfile ~/Brewfile

mkdir -p ~/.config ~/bin
ln -s ~/git/dotfiles/nvim ~/.config/nvim
ln -s ~/git/dotfiles/bin/sim ~/bin/sim
```

Install Homebrew dependencies with:

```bash
brew bundle --file ~/Brewfile
```

## Neovim plugins

Neovim plugins are managed with vim-plug. Install vim-plug and then install the
declared plugins, including Conform:

```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim '+PlugInstall --sync' +qa
```

CoC extensions are declared in `nvim/init.vim`. Conform owns format-on-save;
CoC is used for completion and diagnostics.

Update Neovim plugins with `:PlugUpdate` or the `,bu` mapping.
