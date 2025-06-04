
BKP="$HOME/bkp/"
#BKP="~/bkp/" # colocar hd bkp1 e hd bkp2
# duplicar comandos para fazerem para os dois hds

#mkdir bkp

rsync -avz --delete --progress ~/.ssh $BKP
rsync -avz --delete --progress ~/media $BKP

rsync -avz --delete --progress ~/Documents $BKP
rsync -avz --delete --progress ~/Downloads $BKP

rsync -avz --delete --progress --exclude 'eln-cache/' --exclude 'elpa/'  ~/dotfiles $BKP
rsync -avz --delete --progress --exclude 'venv/' ~/hub $BKP
rsync -avz --delete --progress --exclude 'venv/' ~/workspace $BKP
