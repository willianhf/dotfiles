# installs homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# installs oh-my-zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
  fzf
  orbstack
  fnm
)

brew install "${apps[@]}"

brew install --cask raycast
brew install --cask ghostty
brew install --cask spotify
brew install --cask 1password
brew install --cask thebrowsercompany-dia

# installs xcode cli tools
xcode-select --install
