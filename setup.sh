# chmod +x ./install.sh
# ./install.sh

stow --verbose --restow --target=$HOME */

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
