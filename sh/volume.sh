#!/bin/bash
#pacmd set-sink-input-volume   $(pacmd list-sink-inputs|grep  $(ps aux|awk "/ffplay \/home\/h\/data\/music/{print \$2}") -B21|awk 'NR==1{print $2}') $(( 65500/100*70 ))
#info=''' \
#1 sink input(s) available.
#    index: 9                                                     1行  在这里得到索引，记住：这个是会变的 所以通过ps aux|awk '/..../print $2'
#	driver: <protocol-native.c>                              更新id和索引
#	flags:
#	state: RUNNING
#	sink: 0 <alsa_output.pci-0000_00_1f.3.analog-stereo>
#	volume: front-left: 45850 /  70% / -9.31 dB,   front-right: 45850 /  70% / -9.31 dB   在这里获取音量  6行
#	        balance 0.00
#	muted: no                                                        8行
#	current latency: 27.75 ms
#	requested latency: 11.61 ms
#	sample spec: s16le 2ch 44100Hz
#	channel map: front-left,front-right
#	             Stereo
#	resample method: (null)
#	module: 8
#	client: 106 <ffplay>
#	properties:
#		media.name = "Audio Stream"
#		application.name = "ffplay"
#		native-protocol.peer = "UNIX socket client"
#		native-protocol.version = "35"
#		application.process.id = "117497"**********************在这里定位pacmd list-sink-inpus|grep 117497 -B 16/21
#		application.process.user = "h"
#		application.process.host = "TouYu"
#		application.process.binary = "ffplay"
#		application.language = "C"
#		window.x11.display = ":0"
#		application.process.machine_id = "ea0953c216fc4f34bc609105c11c3206"
#		application.process.session_id = "3"
#		module-stream-restore.id = "sink-input-by-application-name:ffplay"
#'''
#info='''\
##把相关信息保存到文件里面，  "/home/h/sh/.state"
#
#name  value1  value2 
#ffplay-mic  mute   77%
#music       unmute   77%

#'''

#$(pacmd list-sink-inputs|grep  $(ps aux|awk "/ffplay \/home\/h\/data\/music/{print \$2}") -B21|awk 'NR==1{print $2}') $(( 65500/100*70 ))
#  抓取信息
file='~/sh/.state'
name="ffplay\ \/home\/h\/data\/music"
name='ffplay /home/h/data/music'

case $1 in
	l|list)
		for id in $(pacmd list-sink-inputs|grep 'process\.id'|awk -F\" '{print $2}');do
			ps aux|grep $id|grep -v grep | \
				awk  '{printf NR" pid:"$2" @";for(i=11;i<=NF;i++){printf $i" "};print " "}'; done
		printf 'ps:可以是正则，请输入名字或者数字:  '
		read input
		if [[ $input =~ [0-9]+ ]];then
			name="$(for id in $(pacmd list-sink-inputs|grep 'process\.id' |  \
				awk -F\" '{print $2}');do \
				ps aux|grep $id|grep -v grep | \
				awk  '{for(i=11;i<=NF;i++){printf $i" "};print " "}';done|
			 awk "NR==$input"|sed -E 's/(.*[^ ])/\1/g')"

			echo "你输入了数字 $input"
			if [[ -z $name ]];then echo "你输了个啥呀。";fi
			echo "${name}@3" 
			echo " "
			echo ''' ...试试  try  m/u/i/d/D/[v 3000]   :'''
			read -p '请稍等,请输入选项' input 
		fi
		;;
	*)
		echo '可以试试  l， 查看有那些音乐程序'
		echo '下次一定！'
		echo '无效输入，改为默认行为! ...'
		input=ll
		;;
esac


echo "这个应用的信息："
pacmd list-sink-inputs |  \
  grep $(ps aux|grep "${name}"|awk 'NR==1{print $2}') -B 21 | #查找我们要的程序; 
awk  '''    BEGIN {
		Index=1
		mute=true
		volume=-1
	}
	{
		if(NR==1)print "index", $2
		if(NR==8)print "mute", $2
		if(NR==6)print "volume", $3
	}  ''' 

P=($(pacmd list-sink-inputs|grep $(ps aux|grep "${name}"|awk 'NR==1{print $2}') -B 21|awk '{if(NR==1)print $2;if(NR==6)print $3;if(NR==8)print $2}'))
#echo $(pacmd list-sink-inputs|grep $(ps aux|grep "${name}"|awk 'NR==1{print $2}') -B 21)
#echo ${P[0]}  #index
#echo ${P[1]}  #mute, ture or false?
#echo ${P[2]}  #volume,  max 65500
case $input in
	m|mute)
	pacmd set-sink-input-mute ${P[0]} true
	;;
	u|unmute)
	pacmd set-sink-input-mute ${P[0]} false
	;;
	i|increase)
	pacmd set-sink-input-volume ${P[0]} $(( ${P[2]}/100*110 ))
	;;
	d|decrease)
	pacmd set-sink-input-volume ${P[0]} $(( ${P[2]}/100*90 ))
	;;
	D|default)
	pacmd set-sink-input-volume ${P[0]} 40000
	;;
	v|volume)
	pacmd set-sink-input-volume $2
	;;
	*)
		echo '''你输入错啦！ ...试试  try  m/u/i/d/D/ v 3000
		mute / unmute / increase / decrease / default
		or  volume 43456   (this value max is 65500, but you can bigger than it, which will amixfy the volume.
		'''
esac

#  设置参数
#用gawk比较方便

