#!/usr/bin/env sh 

BRIGHT_FILE="/sys/class/backlight/amdgpu_bl0/brightness"

function change_bright() {
	echo ${1}
	exec /usr/bin/tee /sys/class/backlight/amdgpu_bl0/brightness <<< ${1}	
}

function main() {
	if [ $# -gt 1 ]; then
		case ${1} in
			"+")	
                let "NEW_BRIGHTNESS=$( cat $BRIGHT_FILE )+${2}"
				change_bright $NEW_BRIGHTNESS
				;;
			"-")
                let "NEW_BRIGHTNESS=$( cat $BRIGHT_FILE )-${2}"
				change_bright $NEW_BRIGHTNESS
				;;
			"=")
				change_bright ${2}
				;;
			*)
				echo "Invalid paramters!"
				;;
		esac
	else
		echo "To increase brightness use: bright + N"
		echo "To dicrease brightness use: bright - N"
		echo "To set brightness: bright = N"
	fi
		
}

main $@
