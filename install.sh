#!/bin/bash -e

DEST_FILE=/tmp/vim_config_files.sh
rm -fR $DEST_FILE

wget -q -O- http://caspian311.github.io/vim_config/files.sh > $DEST_FILE

chmod +x $DEST_FILE

bash $DEST_FILE

rm -f $DEST_FILE
