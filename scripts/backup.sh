
BKP="$HOME/bkp/"
#BKP="~/bkp/" # colocar hd bkp1 e hd bkp2
# duplicar comandos para fazerem para os dois hds

#mkdir bkp


# Fazer bkp
rsync -avz --delete --progress ~/.ssh $BKP
rsync -avz --delete --progress ~/media $BKP

rsync -avz --delete --progress ~/Documents $BKP
rsync -avz --delete --progress ~/Downloads $BKP

rsync -avz --delete --progress --exclude 'venv/' ~/hub $BKP
rsync -avz --delete --progress --exclude 'venv/' ~/workspace $BKP
rsync -avz --delete --progress --exclude 'eln-cache/' --exclude 'elpa/'  ~/dotfiles $BKP

# Restaurar do bkp
rsync -avz --delete --progress $BKP ~/.ssh
rsync -avz --delete --progress $BKP ~/media

rsync -avz --delete --progress $BKP ~/Documents
rsync -avz --delete --progress $BKP ~/Downloads

rsync -avz --delete --progress --exclude 'venv/' $BKP ~/hub
rsync -avz --delete --progress --exclude 'venv/' $BKP ~/workspace
rsync -avz --delete --progress --exclude 'eln-cache/' --exclude 'elpa/' $BKP ~/dotfiles
