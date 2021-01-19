Installing dwm and co must currently be done manually.
Apply the respective patches, this should include changes to the makefile variables, so that
everything gets installed in either $HOME/.bin or $HOME/.local/bin

Installing xkblayout-state can be done by cding into the folder and running
`PREFIX=$HOME/.local make install`
