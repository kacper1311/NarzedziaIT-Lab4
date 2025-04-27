#!/bin/bash

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    date
elif [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
    count=100
    if [ -n "$2" ]; then
        count=$2
    fi
    
    for i in $(seq 1 $count); do
        echo "log$i.txt" > "log$i.txt"
        echo "Utworzony przez skrypt.sh" >> "log$i.txt"
        echo "Data: $(date)" >> "log$i.txt"
    done
elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Dostępne opcje:"
    echo "--date, -d       - wyświetla dzisiejszą datę"
    echo "--logs, -l       - tworzy 100 plików logów"
    echo "--logs N, -l N   - tworzy N plików logów"
    echo "--init           - klonuje repozytorium i ustawia PATH"
    echo "--error, -e      - tworzy 100 plików errorów"
    echo "--error N, -e N  - tworzy N plików errorów"
    echo "--help, -h       - wyświetla pomoc"
fi
