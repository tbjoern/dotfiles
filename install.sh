git submodule init
git submodule update

DOTFILES_DIR=$HOME/.dotfiles
DEJAVU_FONTS_DIR=$DOTFILES_DIR/fonts/DejaVuSansMono
declare -a DEJAVU_FONTS=('DejaVu Sans Mono for Powerline.ttf' 'DejaVu Sans Mono Bold for Powerline.ttf')

install -d $HOME/.fonts
install -d $DOTFILES_DIR/.config
install -d $HOME/.tmux/plugins
install -d $HOME/.vim/autoload

cp $DOTFILES_DIR/.vim/autoload/plug.vim $HOME/.vim/autoload

ln -s $DOTFILES_DIR/.config $HOME/.config
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/.Xresources $HOME/.Xresources
ln -s $DOTFILES_DIR/.Xdefaults $HOME/.Xdefaults
ln -s $DOTFILES_DIR/.xinitrc $HOME/.xinitrc
ln -s $DOTFILES_DIR/.vimrc $HOME/.vimrc
ln -s $DOTFILES_DIR/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_DIR/.tmux/plugins/tpm $HOME/.tmux/plugins/tpm

for font in "${DEJAVU_FONTS[@]}"; do
    ln -s $DEJAVU_FONTS_DIR/$font $HOME/.fonts/$font
done
fc-cache -fv
