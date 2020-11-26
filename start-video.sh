#!/bin/sh

rm -f stream.m3u8 stream*.ts

exec ffmpeg \
	-f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 \
	-f alsa -ac 1 -i hw:1 \
	-c:v libx264 -crf 21 -profile:v main -level 3.1 -pix_fmt yuv420p -preset veryfast -tune zerolatency -g 25 -sc_threshold 0 \
	-c:a aac -b:a 40k -ac 2 \
	-f hls -hls_time 6 -hls_playlist_type event stream.m3u8
	#-f hls -hls_time 6 -hls_list_size 6 -hls_flags delete_segments+program_date_time stream.m3u8
