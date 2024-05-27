# installs homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

apps=(
  git
  tmux
  httpie
  neovim
  nvm
  zoxide
  spaceship
  oven-sh/bun/bun
  jabba
  fzf
  orbstack
)

brew install "${apps[@]}"

brew install --cask alacritty
brew install --cask raycast
brew install --cask arc
brew install --cask spotify

# installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installs xcode cli tools
xcode-select --install
