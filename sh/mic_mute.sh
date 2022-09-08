#!/bin/bash
if [[ $1 -eq 1 ]];then
	pacmd set-sink-input-mute $(pacmd list-sink-inputs|grep $(ps au|grep 'ffplay -f pulse -i alsa_input.pci-0000_00_1f.3.analog-stereo -showmode 0'|grep -v grep|awk '{print $2}') -B21|awk '/index/{print $2}') true
else
	pacmd set-sink-input-mute $(pacmd list-sink-inputs|grep $(ps au|grep 'ffplay -f pulse -i alsa_input.pci-0000_00_1f.3.analog-stereo -showmode 0'|grep -v grep|awk '{print $2}') -B21|awk '/index/{print $2}') false
fi

