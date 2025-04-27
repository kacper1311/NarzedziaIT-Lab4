#!/bin/bash

if [ "$1" = "--date" ]; then
    date
elif [ "$1" = "--logs" ]; then
    for i in {1..100}; do
        echo "log$i.txt" > "log$i.txt"
        echo "Utworzony przez skrypt.sh" >> "log$i.txt"
        echo "Data: $(date)" >> "log$i.txt"
    done
fi
