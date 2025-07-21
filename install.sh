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
  oven-sh/bun/bun
  fzf
  orbstack
  fnm
  pnpm
)

brew install "${apps[@]}"

brew install --cask raycast
brew install --cask ghostty
brew install --cask spotify
brew install --cask 1password
brew install --cask thebrowsercompany-dia
brew install --cask discord
brew install --cask whatsapp
brew install --cask visual-studio-code

# installs xcode cli tools
xcode-select --install
#
# installs spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

