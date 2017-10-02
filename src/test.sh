#!/bin/bash
filename=${1%.*}
echo $filename
firstline=$(head -n 1 $1)
total=$(echo "$firstline" | sed -e 's/.*=\(.*\)\;/\1/')
echo ${total}
for i in $(seq 1 $total)
do
    echo $i
    echo $filename
    output_info=$(openscad $1 -o $filename.stl 2>&1 | sed -n '1p')
    echo ${output_info}
    subfilename=$(echo "$output_info" | sed -e 's/.*"\(.*\)\"/\1/')
    echo $subfilename
    mv $filename.stl $subfilename$i.stl
done
