source ~/.config/custom_vars.sh

echo "\
polybar
xorg-xrandr
feh

github-cli

neovim
fd
ripgrep
xclip
lua-language-server
nodejs-emmet-ls
python-lsp-server
ltex-ls-bin
marksman-bin

zsh
oh-my-zsh-git
zsh-autosuggestions-git
zsh-syntax-highlighting-git
zsh-theme-powerlevel10k

zoxide

vivaldi
telegram-desktop
btop
spotify-launcher
rofi
wezterm
keepassxc

otf-comicshanns-nerd
"

if [[ $HOSTNAME == $NOTEBOOK_HOSTNAME ]]; then
	echo "acpi"
else
	echo "arandr"
fi
