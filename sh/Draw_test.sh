DS=1.0 # display start
DE=6.0 # display end
FID=1.5 # fade in duration
FOD=5 # fade out duration
#ffplay -f lavfi "color,drawtext=textfile=/home/h/.say:fontsize=50:fontfile=FreeSerif.ttf:fontcolor_expr=ff0000%{eif\\\\: clip(255*(1*between(t\\, $DS + $FID\\, $DE - $FOD) + ((t - $DS)/$FID)*between(t\\, $DS\\, $DS + $FID) + (-(t - $DE)/$FOD)*between(t\\, $DE - $FOD\\, $DE) )\\, 0\\, 255) \\\\: x\\\\: 2 }"

#ffmpeg -r 20 -i /dev/video0  -vf "drawtext=textfile=/home/h/.say:fontsize=h/10:x=(w-text_w)/2:y=(h-text_h*2):fontfile=FreeSerif.ttf:fontcolor_expr=ff0000%{eif\\\\: clip(255*(1*between(t\\, $DS + $FID\\, $DE - $FOD) + ((t - $DS)/$FID)*between(t\\, $DS\\, $DS + $FID) + (-(t - $DE)/$FOD)*between(t\\, $DE - $FOD\\, $DE) )\\, 0\\, 255) \\\\: x\\\\: 2 }" -frames 100 -r 20 -f  flv ~/out.flv

# ok , it works.     
#ffmpeg -r 20 -i /dev/video0  -filter_complex "[0:v]scale=500:-1,drawtext=textfile=/home/h/.say:fontsize=h/10:x=(w-text_w)/2:y=(h-text_h*2):fontfile=FreeSerif.ttf:fontcolor_expr=ff0000%{eif\\\\: clip(255*(1*between(t\\, $DS + $FID\\, $DE - $FOD) + ((t - $DS)/$FID)*between(t\\, $DS\\, $DS + $FID) + (-(t - $DE)/$FOD)*between(t\\, $DE - $FOD\\, $DE) )\\, 0\\, 255) \\\\: x\\\\: 2 }" -frames 100 -r 20 -f  flv ~/out.flv

ffmpeg -re  -i '/home/h/print/B/09-13-01@22-09-04.flv' -i /dev/video0  -filter_complex "[1:v]scale=500:-1,drawtext=textfile=/home/h/.say:fontsize=h/4:x=(w-text_w)/2:y=(h-text_h*2):fontfile=FreeSerif.ttf:fontcolor_expr=ff0000%{eif\\\\: clip(255*(1*between(t\\, $DS + $FID\\, $DE - $FOD) + ((t - $DS)/$FID)*between(t\\, $DS\\, $DS + $FID) + (-(t - $DE)/$FOD)*between(t\\, $DE - $FOD\\, $DE) )\\, 0\\, 255) \\\\: x\\\\: 2 }[font];[0:v][font]overlay=0:0" -frames 100 -c:a copy -f  flv ~/out.flv
