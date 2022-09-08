#ffplay -f pulse -i  'alsa_input.pci-0000_00_1f.3.analog-stereo' -showmode 0
ffplay -f pulse -i  $(pactl get-default-source) -showmode 0
