# manter bkp via rsync de:
# Documents/books
# .ssh/
chmod 600 hub ime lab
# ~/media/recordings/conversas/
# workspace/scripts3

# descomentar #Color de
nano /etc/pacman.conf

sudo pacman -S stow tree maim xclip xdotool unzip

mkdir -p ~/media/recordings/conversas/
mkdir -p ~/media/recordings/git
mkdir -p ~/media/recordings/raws
mkdir -p ~/media/pics/screenshots/
mkdir -p ~/programas/

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo pacman -S git
git config --global user.name paulo
git config --global user.email bisdusty@gmail.com

git clone https://github.com/paulo3121/dotfiles.git

stow i3
stow xorg
sudo pacman -S xorg xorg-server xorg-xinit i3 i3-wm i3lock i3status i3blocks dmenu network-manager-applet
sudo pacman -S nvidia nvidia-utils
sudo mkinitcpio -P
# reboot
nvidia-xconfig # acho que é suficiente para tirar o screen tearing

yay google-chrome
unzip Downloads/uBlock0_1.64.0.chromium.zip -d programas/

stow emacs
sudo pacman -S emacs

sudo pacman -S alsa-utils alsa-firmware alsa-lib sof-firmware # acho que esta incompleto

stow zsh
sudo pacman -S zsh
chsh -s $(which zsh)

sudo pacman -S atuin
# echo 'eval "$(atuin init zsh)"' >> ~/.zshrc #ja esta no .zshrc

stow kitty
sudo pacman -S kitty

sudo pacman -S python-virtualenv

stow mpv
sudo pacman -S mpv

sudo pacman -S zathura zathura-pdf-mupdf zathura-cb

# push albums

# compatibilidade nvidia
# kitty


# pc antigo
# paulo
#!# salvar Documents/books
#!# salvar chaves /.ssh
#!# salvar rec/conversas novos. excluir pouco importantes
#!# confirmar se todos os Videos/cursos_mae estao no hd



# synchro
#!# salvar workspace/scripts
#!# salvar workspace/synpy

# aur
# yay
# o que é e como usar

# terminal
# st, alacritty ou urxvt?

# i3
# tem mais comandos no video do cara da suica
sudo pacman -S xorg xorg-server xorg-utils xorg-xinit xterm i3 i3-wm i3lock i3status i3blocks dmenu network-manager-applet
sudo cp /etc/X11/xinit/xinitrc /.xinitrc
#print screen i3


# git


# python
# virtualenv?
sudo pacman -S python-virtualenv

# ffmpeg
sudo pacman -S ffmpeg
# testar scripts rec

# dotfiles

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
