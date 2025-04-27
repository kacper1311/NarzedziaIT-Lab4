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
    echo "--date, -d         - wyświetla dzisiejszą datę"
    echo "--logs, -l         - tworzy 100 plików logów"
    echo "--logs N, -l N     - tworzy N plików logów"
    echo "--init             - klonuje repozytorium i ustawia ścieżkę w PATH"
    echo "--error, -e        - tworzy 100 plików errorów"
    echo "--error N, -e N    - tworzy N plików errorów"
    echo "--help, -h         - wyświetla pomoc"
elif [ "$1" = "--init" ]; then
    repo_url=$(git remote get-url origin)
    git clone "$repo_url" .
    echo "export PATH=\$PATH:$(pwd)" >> ~/.zshrc
    echo "export PATH=\$PATH:$(pwd)" >> ~/.bash_profile
    source ~/.zshrc 2>/dev/null || source ~/.bash_profile 2>/dev/null
    echo "Repozytorium sklonowane i ścieżka dodana do PATH"
elif [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    count=100
    if [ -n "$2" ]; then
        count=$2
    fi
    
    for i in $(seq 1 $count); do
        mkdir -p "error$i"
        echo "error$i.txt" > "error$i/error$i.txt"
        echo "Utworzony przez skrypt.sh" >> "error$i/error$i.txt"
        echo "Data: $(date)" >> "error$i/error$i.txt"
    done
fi
