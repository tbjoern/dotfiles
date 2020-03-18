# Tbjoern's Dotfiles

Collection of my dotfiles.

These dotfiles are intended to run with xterm, zsh, vim

For everything to run properly, clone this into $HOME/.dotfiles
Dont forget to init/update the submodules

For xterm to work with the DejaVu fonts, copy `DejaVu Sans Mono for Powerline` and the bold version $HOME/.fonts
Then run `fc-cache -fv` to update the font cache.

## Font

Currently I am using [DejaVu Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf)

## Helpful tools

Inspect a ttf font: [CharacterMap](http://mathew-kurian.github.io/CharacterMap/)

[Nerd Font cheat sheet](https://www.nerdfonts.com/cheat-sheet)

### Unicode glyphs in XTerm

Previously I was using DejaVu Sans Mono for Powerline. It has basic powerline glyphs patched in, but not more. I wanted to use FontAwesome Glyphs, so I installed ttf-font-awesome (arch). 

I tried to use the Font Awesome font as a secondary font in XTerm, but specifying two fonts yielded the following message from XTerm:
```
xterm: too many fonts for fNorm, ignoring Font Awesome
```
I searched for what 'fNorm' is supposed to mean, but neither man pages nor google had an answer. I suspect it means that XTerm is unable to merge the fonts or something.
Using `fc-list :scalable=true:spacing=mono: family` showed that FontAwesome is indeed not mono-spaced by design. That could also be the culprit.

So to fix that I switched to using `DejaVuSansMono Nerd Font Mono`. Now everything works, yay!
