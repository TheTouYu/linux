#!/bin/sh
nmcli device wifi rescan &
for i in '1 2 3 4 5 6';do
	nmcli device wifi connect h
	sleep 2
done

