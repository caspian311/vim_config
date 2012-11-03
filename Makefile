
create_script: 
	tar czvf vim-config.tgz .vim .vimrc .tmux.conf
	cat script-only.sh > install.sh
	cat vim-config.tgz >> install.sh

clean:
	rm -f install.sh vim-config.tgz

all: clean create_script
