path=$(pwd)

# vim
ln -sf $path/vim/.vimrc $HOME/.vimrc

# nvim
[ ! -d $HOME/.config/nvim ] && mkdir -p $HOME/.config/nvim
ln -sf $path/nvim/init.vim $HOME/.config/nvim/init.vim

# tmux
ln -sf $path/tmux/.tmux.conf $HOME/.tmux.conf

# zsh
ln -sf $path/zsh/.zshrc $HOME/.zshrc
