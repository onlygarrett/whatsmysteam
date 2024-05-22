#!/usr/bin/env bash

PS3="Which Drive to search:"
_user="$(id -u -n)"
select choice in "Check usual install location?" "Check entire disk?"; do
	echo "Selected character: $choice"
	echo "Selected number: $REPLY"
	case $REPLY in
	1)
		find /home/$_user/.local/share/ -type d -iname 'SteamLibrary' -print 2>/dev/null
		;;
	2)
		find / -type d -iname 'SteamLibrary' -print 2>/dev/null
		;;
	esac
	break
done
