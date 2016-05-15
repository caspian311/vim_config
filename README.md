#¡¡¡OUTDATED!!!# 
Do not use -- this has been chnaged fundamentally and will not work as described below... more to follow...


##VIM CONFIG##

The repository consists of two on-going branches: master and gh-pages. The configurations are maintained on master and gh-pages publishes changes to the [http://caspian.github.io/vim_config](http://caspian311.github.io/vim_config) site.

### How it works ###

#### install.sh ####

This is the entry point into the script. It should only download the files.sh script, make it executable, execute it, then delete it.

#### script-only.sh ####

This is the header of the self-extracting shell script. It ends with a line that is grep-able and it will then grep through himself looking for that line, get all data afterwards and put it in a tar-ball and operate on it.

#### Makefile ####

Creates a files.sh that contains the script-only.sh at the top and then a tar ball of all necessary files at the bottom.


### Create self extracting shell script ###

Just run the Makefile from the top level directory:

    $ make
    
This will create a *files.sh* in the top level. That file will need to be transferred from the master branch to the gh-pages.

    cp files.sh install.sh ..
    git checkout gh-pages
    mv ../files.sh ../install.sh .

Then you will need to commit and push the changes up to the remote.
    
