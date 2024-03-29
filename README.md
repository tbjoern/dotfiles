# Tbjoern's Dotfiles

Collection of my dotfiles.

These dotfiles are intended to run with xterm, zsh, vim

For everything to run properly, clone this into $HOME/.dotfiles
Dont forget to init/update the submodules

For xterm to work with the DejaVu fonts, copy `DejaVu Sans Mono for Powerline` and the bold version $HOME/.fonts
Then run `fc-cache -fv` to update the font cache.

## Installation

### Desktop Environment

Make sure to set `DMENU_PATH` to contain all directories with executables that should be available in `dmenu`.
Set this variable in your `.zshenv`.

### Slock

```bash
sudo groupadd nogroup
sudo chown root ~/.local/bin/slock
sudo chgrp root ~/.local/bin/slock
sudo chmod +s ~/.local/bin/slock
```

## Font

Currently I am using [DejaVu Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf)

## Helpful links

Inspect a ttf font: [CharacterMap](http://mathew-kurian.github.io/CharacterMap/)

[Nerd Font cheat sheet](https://www.nerdfonts.com/cheat-sheet)

[Center vertically in polybar](https://github.com/polybar/polybar/issues/478) (useful for icons)

### Unicode glyphs in XTerm

Previously I was using DejaVu Sans Mono for Powerline. It has basic powerline glyphs patched in, but not more. I wanted to use FontAwesome Glyphs, so I installed ttf-font-awesome (arch). 

I tried to use the Font Awesome font as a secondary font in XTerm, but specifying two fonts yielded the following message from XTerm:
```
xterm: too many fonts for fNorm, ignoring Font Awesome
```
I searched for what 'fNorm' is supposed to mean, but neither man pages nor google had an answer. I suspect it means that XTerm is unable to merge the fonts or something.
Using `fc-list :scalable=true:spacing=mono: family` showed that FontAwesome is indeed not mono-spaced by design. That could also be the culprit.

So to fix that I switched to using `DejaVuSansMono Nerd Font Mono`. Now everything works, yay!

## Keyboard Shortcuts Cheat Sheet

### DWM

Modifier Key (M) = Windows Key
Shift (S)
Ctrl (C)

M-Space: dmenu launcher
M-Return: terminal
M-b: toggle statusbar
M-S-c: close window
M-S-q: Quit DWM
M-, M-.: Switch monitor
M-j, M-k: Switch window
M-h, M-l: Resize master/slave window area

