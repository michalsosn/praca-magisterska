#!/bin/sh

#Lists all labels in LaTeX files with places where they're referenced (with \ref) 

for LABEL in $(egrep "label." *.tex | sed "s/^\(.*\):.*label=\?{\(.*\)}.*$/\1:\2/" | sort); do
    echo "$LABEL"
    grep "ref{${LABEL#*:}}" *.tex | xargs -L1 echo "    "
done
