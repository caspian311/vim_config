
create_script: 
	tar czvf vim-config.tgz .vim .vimrc .tmux.conf
	cat script-only.sh > files.sh
	cat vim-config.tgz >> files.sh

clean:
	rm -f files.sh vim-config.tgz

all: clean create_script
