#!/bin/sh

rm -f stream.m3u8 stream*.ts

# should pass in the rtsp url that is already h264 yuv420p and aac
input=$1

exec ffmpeg \
	-i "$input" \
	-c:v copy -c:a copy \
	-f hls -hls_time 6 -hls_list_size 6 -hls_flags delete_segments+program_date_time stream.m3u8