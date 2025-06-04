# manter bkp via rsync de:
# Documents/books
# .ssh/
chmod 600 hub ime lab
# ~/media/recordings/conversas/
# workspace/scripts3


# instalacao arch
# https://youtu.be/68z11VAYMS8?si=Z4AAPpUg8lRVPb4W

# pos instalacao arch
# descomentar #Color de
nano /etc/pacman.conf

sudo pacman -S stow tree maim xclip xdotool unzip

mkdir -p ~/hub/
mkdir -p ~/workspace/
mkdir -p ~/media/recordings/conversas/
mkdir -p ~/media/recordings/git
mkdir -p ~/media/recordings/raws
mkdir -p ~/media/pics/screenshots/
mkdir -p ~/programas/

sudo pacman -S git
git config --global user.name paulo
git config --global user.email bisdusty@gmail.com

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

git clone https://github.com/paulo3121/dotfiles.git

stow i3
stow xorg
# https://youtu.be/sE3LHJ8lEss?si=F3QIF1SW0DjctC3T
sudo pacman -S xorg xorg-server xorg-xinit i3 i3-wm i3lock i3status i3blocks dmenu network-manager-applet
sudo pacman -S nvidia nvidia-utils
sudo mkinitcpio -P
# reboot
startx
nvidia-xconfig # acho que é suficiente para tirar o screen tearing

stow zsh
sudo pacman -S zsh
chsh -s $(which zsh)

yay google-chrome
unzip Downloads/uBlock0_1.64.0.chromium.zip -d programas/

# acho que esta incompleto e som pode nao funcionar
sudo pacman -S alsa-utils alsa-firmware alsa-lib sof-firmware

stow emacs
sudo pacman -S emacs

sudo pacman -S neovim

sudo pacman -S atuin

stow kitty
sudo pacman -S kitty

sudo pacman -S python-virtualenv

stow mpv
sudo pacman -S mpv

sudo pacman -S zathura zathura-pdf-mupdf zathura-cb

# sudo pacman -S ffmpeg
# testar scripts rec

# mpd

# Synchro
# vpn
sudo pacman -S networkmanager-l2tp strongswan

ssh

# firefox
sudo pacman -S firefox

	# tdf
        # intellij
        # java 1.8
        # gradle

sudo pacman -S intellij-idea-community-edition jdk8-openjdk gradle
# pacman intellij nao cria .desktop (logo, nao aparece para o dmenu. gpt sugeriu instalar pelo yay do aur). 
# yay eh melhor?
# como usar o gradle para gerenciar versoes java (sem o jdk8-openjdk instalado manualmente)

	clojure
	atc
	eclipse
	dbeaver
	
	front
	# usar intellij, emacs e vscode durante migracao p nvim

	ae
	scripts
	oci

	sr8
	pem


Paulo
	chrome - ublock
	edge
	spotify
	soulseek - nicotine+
	zathura
	yt-dlp
	virtualenv??
	emacs
	dotfiles
	terminal (alacrity, st, ...)
	bash fish zsh
	atuin?
	foliate
	asdf?

rec
usp
hub - fazer pushs
books
sudo pacman -S rsync
