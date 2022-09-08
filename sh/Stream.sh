#/usr/local/sbin/stream-to-twitch

#!/bin/bash
#
# Stream screen and audio (speakers and microphone) to Twitch.tv using FFmpeg.
#
# Usage: stream-to-twitch path/to/key

set -euo pipefail
wf-recorder -D -c h264_vaapi -d /dev/dri/renderD128 -f re.flv <<<y &sleep 5
#######################################
# Stream to Twitch.tv.
# Globals:
#   None.
# Arguments:
#   Stream key. A string.
# Returns:
#   None.
#######################################
stream_to_twitch() {
    res_output="1920x1080" # output resolution
    res_output="2569x1440" # output resolution
    #fps="60" # target FPS
    readrate="60"
    gop="120" # i-frame interval, should be double of fps
    gop_min="60" # min i-frame interval, should be equal to fps
    probesize="42M" # https://stackoverflow.com/a/57904380
    threads="2" # max 6
    cbr="1500k" # constant bitrate (should be between 1000k–3000k)
    quality="ultrafast" # one of the many FFmpeg presets
    quality="faster" # one of the many FFmpeg presets
    audio_input_speakers="0" # speakers' sink id
    audio_input_mic="default" # microphone's sink id
    audio_rate="44100"
    stream_server="" # see https://stream.twitch.tv/ingests for list
    stream_key="${1}" # key will be passed as an agument from the command line
    loglevel="warning" # supress unecessary information from printing

    ffmpeg \
        -loglevel "${loglevel}" \
        -f flv -r ${readrate} -probesize ${probesize} -i re.flv \
        -f pulse -i "${audio_input_speakers}" \
        -f pulse -i "${audio_input_mic}" \
        -filter_complex "[2]highpass=f=200,lowpass=f=3000[hl];[1][hl]amix=inputs=2:weights='1 1'[a]" \
        -map 0:v -map [a] \
        -f flv -ac 2 -ar ${audio_rate} \
        -vcodec copy -g ${gop} -keyint_min ${gop_min} -b:v ${cbr} \
        -minrate ${cbr} -maxrate ${cbr} -pix_fmt yuv420p \
        -s ${res_output} -preset "${quality}" -tune film -acodec aac \
        -threads ${threads} -strict normal \
        -bufsize ${cbr} \
        $1 
        #"rtmp://${stream_server}.twitch.tv/app/${stream_key}"
}

# Get stream key securely stored with the password manager "pass"
# and pass the key to the script to start the stream.
#stream_to_twitch "$(pass "${1}")"
stream_to_twitch "$1" ||pkill -INT wf-recorder

