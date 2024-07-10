# Config files for Arch Linux
Mainly, it is just template/example for your own configs.

## Okay, show me what you got

* os: [arch linux](https://archlinux.org)
* package manager: [paru](https://github.com/Morganamilo/paru)
* wm: [bspwm](https://github.com/baskerville/bspwm)
* bar: [polybar](https://github.com/polybar/polybar)
* terminal: [wezterm](https://github.com/wez/wezterm)
* shell: [zsh](https://www.zsh.org) + [zoxide](https://github.com/ajeetdsouza/zoxide) as replacement for `cd`
* editor: [nvim](https://github.com/neovim/neovim)
* some additional stuff, listed in `.config/get_packages.sh`

## Structure

All my configs located here. I use [stow](https://www.gnu.org/software/stow/) to create soft-links to them in home folder. For example: after `cd ~/config; stow .` `~/.config/bspwm/bspwmrc` is now soft-link to `~/config/.config/bspwm/bspwmrc`

Some additional scripts (located in `.config`):

* `custom_vars.sh` - I use this one to determine if scripts runs on my pc or on my notebook (their hostnames are different). Plus I declare there some additional variables like `WALLPAPERS_FOLDER`.
* `get_packages.sh` - Echoes main packages needed for system to work.
* `install.sh` - Installs `paru`, updates packages and installs every package that `get_packages.sh` echoes.
* `change_sink_source.sh` - Personal script to change between headphones and speakers.

## How to set up

1. Download Arch image, burn it into the flash (or use [Ventoy](https://github.com/ventoy/Ventoy), multiple ISO images on one USB stick)
2. Connect to Wi-Fi (if you use notebook)
3. Launch `archinstall` and configure for your need (for Profile section I use Bspwm, audio: pipewire)
4. In additional packages you specify `git stow wezterm`
5. Hit Install
6. chrot in your system
7. `cd /home/here_goes_your_username/` (username is `maks` in my case, not `root`!)
8. `git clone https://github.com/dudozermaks/config.git` (or choose your own repo)
9. `cd config`
10. `touch secret_vars.sh`
11. `chmod 755 secret_vars.sh`
12. `stow .` (read about that one in Structure section)
13. `exit`
14. `reboot`

Now you have (almost) fully functional Bspwm setup.
Then login to Bspwm session with your user credentials.
1. Open terminal with `Super+Enter`
2. `chmod 755 ~/.config/install.sh`
3. `~/.config/install.sh`
4. `chsh` (use `/usr/bin/zsh`)

Now main setup is done!

You can download some wallpapers into `.config/wallpapers` folder. `feh` would choose random one on every startup.
