# bing_ <super> <ctrl> <shift> KEY_M

state=$(awk '/mic_switch/{print $2}' ~/sh/.state)
if [[ $state == 'on' ]];then
	# off
	kill $(ps au|awk '/ffplay -f pulse -i alsa_input.pci-0000_/{print $2}'|sed -n 1p)
	sed 's/(mic_switch )*/\1off' ~/sh/.state
else
	# on
	ffplay -f pulse -i  'alsa_input.pci-0000_00_1f.3.analog-stereo' -showmode 0
fi
