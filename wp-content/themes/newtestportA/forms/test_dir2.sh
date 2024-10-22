#!/bin/bash 
#chmod u+x run_all.sh 
#create directory 
cscript //nologo ./mydirectory.vbs

mydirectory="$(<./mydirectory.txt)"

folderA="RICOFOLDER-A"
scrn_directory=$mydirectory'\'$folderA'\'
echo $scrn_directory
