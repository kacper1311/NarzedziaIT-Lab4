#!/bin/bash

if [ "$1" = "--date" ]; then
    date
elif [ "$1" = "--logs" ]; then
    count=100
    if [ -n "$2" ]; then
        count=$2
    fi
    
    for i in $(seq 1 $count); do
        echo "log$i.txt" > "log$i.txt"
        echo "Utworzony przez skrypt.sh" >> "log$i.txt"
        echo "Data: $(date)" >> "log$i.txt"
    done
elif [ "$1" = "--help" ]; then
    echo "Dostępne opcje:"
    echo "--date   - wyświetla dzisiejszą datę"
    echo "--logs   - tworzy 100 plików logów"
    echo "--logs N - tworzy N plików logów"
    echo "--help   - wyświetla pomoc"
fi
