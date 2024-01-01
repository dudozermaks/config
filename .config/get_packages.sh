source ~/.config/custom_vars.sh

echo "\
polybar
xorg-xrandr
dunst
libnotify
feh
playerctl

github-cli
bat
scrot

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
zsh-autosuggestions
zsh-syntax-highlighting
zsh-theme-powerlevel10k

zoxide

vivaldi
telegram-desktop
btop
spotify-launcher
rofi
wezterm
keepassxc
kdeconnect
bashmount
pavucontrol

shadowsocks-libev-static

otf-comicshanns-nerd
noto-fonts-emoji
"

if [[ $HOSTNAME == $NOTEBOOK_HOSTNAME ]]; then
	echo "acpi"
else
	echo "\
arandr
numlockx
"
fi
