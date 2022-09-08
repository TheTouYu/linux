name=$1  # such as mic_on.sh , mic_off,  name=mic
name_file="/home/h/sh/$name"
state_file="/home/h/sh/.state"
state=$(awk "/$name/{print \$2}" $state_file)

if [[ $state == 'on' ]];then
	bash ${name_file}_off.sh 2>&1 > /dev/null &
	sed -E "s/($name).*/\1 off/" -i $state_file 
else
	bash ${name_file}_on.sh 2>&1 > /dev/null  &
	sed -E "s/($name) .*/\1 on/" -i $state_file
fi
