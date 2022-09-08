ffmpeg -f pulse -i $(pactl get-default-source) -f mpegts -|ffplay -f mpegts -i -
