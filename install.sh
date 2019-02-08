git submodule init
git submodule update

DOTFILES_DIR=$HOME/.dotfiles
DEJAVU_FONTS_DIR=$DOTFILES_DIR/fonts/DejaVuSansMono
declare -a DEJAVU_FONTS=('DejaVu Sans Mono for Powerline.ttf' 'DejaVu Sans Mono Bold for Powerline.ttf')

install -d $HOME/.fonts
install -d $DOTFILES_DIR/.config

ln -s $DOTFILES_DIR/.config $HOME/.config
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/.Xresources $HOME/.Xresources
ln -s $DOTFILES_DIR/.Xdefaults $HOME/.Xdefaults
ln -s $DOTFILES_DIR/.xinitrc $HOME/.xinitrc

for font in "${DEJAVU_FONTS[@]}"; do
    ln -s $DEJAVU_FONTS_DIR/$font $HOME/.fonts/$font
done
fc-cache -fv
