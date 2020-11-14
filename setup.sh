path=$(pwd)

# vim
ln -sf $path/vim/.vimrc $HOME/.vimrc

# nvim
[ ! -d $HOME/.config/nvim ] && mkdir -p $HOME/.config/nvim
ln -sf $path/nvim/init.vim $HOME/.config/nvim/init.vim
