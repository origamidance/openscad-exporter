#!/bin/bash
if [ ! -d $2 ]
then
    mkdir $2
fi
filename=${1%.*}
echo $filename
total=$(head -n 1 $1 | sed -e 's/.*=\(.*\)\;/\1/')
echo "total models amount=${total}"
for i in $(seq 1 $total)
do
    subfilename=$(openscad $1 -DmodelId=$i -o $filename.stl 2>&1 | sed -n '1p' | sed -e 's/.*"\(.*\)\"/\1/')
    if [ ! -z $subfilename ]
    then
        echo "exporting $subfilename"
        mv $filename.stl $2$subfilename.stl
        echo "done!"
    else
        rm $filename.stl
    fi
done
