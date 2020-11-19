#! /bin/bash
set -e

# DRY_RUN=true

function link {
	if [[ ! ( (-f $1) || (-d $1 )) ]]; then
		echo "File/Directory $1 does not exist!"
		return 1
	fi
	if [[ -d $2 ]]; then
		echo "Destination file $2 is an existing directory, skipping"
		return 0
	fi
	if [[ -f $2 ]]; then
		echo -n "Destination file $2 already exists, overwrite? y/[n]: "
		read -n 1 overwrite
		echo
		if [[ ! (("$overwrite" = "y") || ("$overwrite" = "Y")) ]]; then
			echo "Skipping $2"
			return 0
		fi
	fi		
	if [[ ! $DRY_RUN = true ]]; then
		ln -s "$1" "$2"
	else
		echo "Linking $1 to $2"
	fi
}

git submodule init
git submodule update

DOTFILES_DIR=$HOME/.dotfiles
DEJAVU_FONTS_DIR=$DOTFILES_DIR/fonts/DejaVuSansMono
declare -a DEJAVU_FONTS=("DejaVu Sans Mono for Powerline.ttf" "DejaVu Sans Mono Bold for Powerline.ttf")

install -dv $HOME/.fonts
install -dv $DOTFILES_DIR/.config
install -dv $HOME/.tmux/plugins
install -dv $HOME/.vim/autoload

cp $DOTFILES_DIR/.vim/autoload/plug.vim $HOME/.vim/autoload

link $DOTFILES_DIR/.config $HOME/.config
link $DOTFILES_DIR/.zshrc $HOME/.zshrc
link $DOTFILES_DIR/.Xresources $HOME/.Xresources
link $DOTFILES_DIR/.Xdefaults $HOME/.Xdefaults
link $DOTFILES_DIR/.Xresources.d $HOME/.Xresources.d
link $DOTFILES_DIR/.xinitrc $HOME/.xinitrc
link $DOTFILES_DIR/.vimrc $HOME/.vimrc
link $DOTFILES_DIR/.tmux.conf $HOME/.tmux.conf
link $DOTFILES_DIR/.tmux/plugins/tpm $HOME/.tmux/plugins/tpm
link $DOTFILES_DIR/.zshenv $HOME/.zshenv
link $DOTFILES_DIR/.emacs $HOME/.emacs

install -m 744 -d $HOME/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/sindresorhus/pure $HOME/.zsh/pure

for font in "${DEJAVU_FONTS[@]}"; do
    link "$DEJAVU_FONTS_DIR/$font" "$HOME/.fonts/$font"
done
fc-cache -fv
