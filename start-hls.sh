#!/bin/sh

rm -f stream.m3u8 stream*.ts

# input_format: ffmpeg -f v4l2 -list_formats all -i /dev/video0
# framerate and video_size: v4l2-ctl --list-formats-ext

exec ffmpeg \
	-f v4l2 \
		-input_format yuyv422 \
		-framerate 15 -video_size 640x480 \
		-i /dev/video0 \
	-f alsa -ac 1 -i hw:1 \
	-c:v h264_omx \
		-b:v 1500k \
		-pix_fmt yuv420p \
		-g 15 \
		-sc_threshold 0 \
	-c:a aac -b:a 40k -ac 2 \
	-f hls -hls_time 6 -hls_list_size 6 -hls_flags delete_segments+program_date_time stream.m3u8
