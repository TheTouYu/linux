kill $(ps aux|awk '/ffplay -f pulse -i alsa_input.pci-0000_/{print $2}'|sed -n 1p)
