#!/bin/sh

rm -f stream.m3u8 stream*.ts

exec ffmpeg \
	-f v4l2 -framerate 20 -video_size 640x360 -thread_queue_size 1024 -i /dev/video0 \
	-f alsa -ac 1 -thread_queue_size 1024 -i hw:1 \
	-c:v libx264 \
		-crf 21 \
		-profile:v main -level 3.1 \
		-pix_fmt yuv420p \
		-preset veryfast \
		-tune zerolatency \
		-g 20 \
		-sc_threshold 0 \
	-c:a aac -b:a 40k -ac 2 \
	-f hls -hls_time 6 -hls_list_size 6 -hls_flags delete_segments+program_date_time stream.m3u8
