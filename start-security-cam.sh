#!/bin/bash

rm -f stream.m3u8 stream*.ts

# should pass in the rtsp url that is already h264 yuv420p and aac
input=$1
if [ "${input:0:7}" != "rtsp://" ]; then
	echo usage: $0 rtsp://somestream
	exit 1
fi

exec ffmpeg \
	-use_wallclock_as_timestamps 1 -i "$input" \
	-c:v copy -g 30 -sc_threshold 0 \
	-c:a copy \
	-f hls -hls_time 4 -hls_list_size 100 -hls_flags delete_segments+program_date_time stream.m3u8
