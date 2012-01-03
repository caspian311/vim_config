#!/bin/bash

mkdir -p /tmp/vim-config-files

CUTLINE=`grep -an "END OF SCRIPT" $0 | grep -v grep | cut -d ":" -f 1`
let "CUTLINE+=1"
tail -n +$CUTLINE $0 > /tmp/vim-config-files/vim-config.tgz

pushd ~/
tar -czvf vim-config-bak.tgz .vim .vimrc
popd

pushd /tmp/vim-config-files
tar -xzf vim-config.tgz
cp -R .vim .vimrc ~/
popd

rm -fR /tmp/vim-config-files

exit 0
#------ END OF SCRIPT --------
