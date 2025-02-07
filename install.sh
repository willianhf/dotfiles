# installs homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

apps=(
  git
  tmux
  httpie
  stow
  neovim
  zoxide
  spaceship
  oven-sh/bun/bun
  openjdk
  fzf
  orbstack
  fnm
)

brew install "${apps[@]}"

brew install --cask raycast
brew install --cask ghostty
brew install --cask arc
brew install --cask spotify

# installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installs xcode cli tools
xcode-select --install
