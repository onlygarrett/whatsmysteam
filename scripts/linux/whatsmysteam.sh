#!/usr/bin/env bash

PS3="Which Drive to search:"
_user="$(id -u -n)"
GREEN='\033[0;32m'
WHITE='\033[0m'

select choice in "Check usual install location?" "Check entire disk?"; do
    printf "\n"
    printf "${GREEN}Here are the games you have currently installed:${NC}\n"
    printf "${GREEN}-----------------------------------------------${NC}\n"
    case $REPLY in
        1)
            steampath=$(find /home/"$_user"/.local/share/ -type d -iname 'SteamLibrary' -print 2>/dev/null)
            printf "${WHITE}%s\n" "$(ls -1 "$steampath"/steamapps/common/)"
        ;;
        2)
            steampath=$(find / -type d -iname 'SteamLibrary' -print 2>/dev/null)
            for path in ${steampath[@]}; do
                printf "${WHITE}%s\n" "$(ls -1 "$path"/steamapps/common/)"
            done
        ;;
    esac
    break
done
