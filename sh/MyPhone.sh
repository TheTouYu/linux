autostart() {
	echo '刚刚挂了！重新启动'
	pkill -INT wf-recorder
	/bin/B.sh ${@: -1}
}

file="$(date '+%H-%M-%S@%y-%m-%d')"
if [[ $# -eq 2 ]];then
	file=$1
fi
if [[ $# -nt 0 ]];then
	echo '请输入密钥!'
	exit  -1;
fi

count=1
Type=mp4
wait_time=3
file=/home/h/print/B/MyPhone-$file.mp4
# new version   除了缓冲时间要长一点，另外最好要有动画或者有音乐在播放，因为是有动态刷新率。
# mpvpaper 动态壁纸 
#killall mpvpaper
#mpvpaper -o "--loop-playlist" eDP-1 '/home/h/video/ys/原神4K-60FPS  雨林.mp4' &
# music
music.sh &
mkfifo $file
while true;do 
	sleep $wait_time
	scrcpy -N --print-fps  --record - | \
	ffmpeg   -readrate 1.0  -f $Type -i - -vcodec copy -acodec copy -f flv    -hide_banner  \
		rtmp://live-push.bilivideo.com/live-bvc/$1 
	echo $(( count++ )) '刚刚挂了！重启中......'
	pkill -INT scrcpy
done
read -p '你要保存文件吗？ y/n' input

if [[ $input != 'y' ]];then 
	rm $file
fi
################################################ do not use
#wf-recorder -a  -c h264_vaapi -p preset=slow  -d /dev/dri/renderD128  -f "$file" <<<y  &

# 是因为到了结尾，属于正常退出
#sleep  10 &&  ffmpeg -re -r 60  -i "$file" -r 60  -vcodec h264_vaapi -acodec aac  -b:a 5m -f flv rtmp://live-push.bilivideo.com/live-bvc/${@: -1} && autostart || autostart
#echo "ffmpeg -re -i $file -vcodec copy -acodec copy -b:a 1m -f flv 'rtmp://live-push.bilivideo.com/live-bvc/${@: -1}' || killall wf-recorder"
#rtmp://live-push.bilivideo.com/live-bvc/'?streamname=live_456150339_1913960&key=81169d04f95022a6fd4a34cf5adfdb33&schedule=rtmp&pflag=1'
