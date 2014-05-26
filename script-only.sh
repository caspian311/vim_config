#!/bin/bash -e

TEMP_DIR=/tmp/vim_config_files
rm -fR $TEMP_DIR
mkdir -p $TEMP_DIR

CUTLINE=`grep -an "END OF SCRIPT" $0 | grep -v grep | cut -d ":" -f 1`
let "CUTLINE+=1"
tail -n +$CUTLINE $0 > $TEMP_DIR/vim-config.tgz

DEST_DIR=~
mkdir -p $DEST_DIR
rm -fR $DEST_DIR/.vim* $DEST_DIR/.tmux.conf $DEST_DIR/.gitconfig

pushd $TEMP_DIR &> /dev/null
	tar -xzf vim-config.tgz
	cp -R .vim .vimrc .tmux.conf .gitconfig $DEST_DIR
popd &> /dev/null

rm -fR $TEMP_DIR

exit 0
#------ END OF SCRIPT --------
