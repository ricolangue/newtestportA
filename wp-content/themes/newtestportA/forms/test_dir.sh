#!/bin/bash 
#chmod u+x run_all.sh 

folderA="RICOFOLDER-A"
mydirectory='D:\RICLANGUE-FILES'
echo $mydirectory > mydirectory.txt
scrn_directory=$mydirectory'\'$folderA'\'
echo $scrn_directory

function realpath()
{
    f=$@
    if [ -d "$f" ]; then
        base=""
        dir="$f"
    else
        base="/$(basename -- "$f")"
        dir="$(dirname -- "$f")"
    fi
    dir="$(cd -- "$dir" && /bin/pwd)"
    echo "$dir$base"
}

realpath 
