# stream-webcam

this is an attempt at figuring out how to stream a webcam to everyone in an HTML page. it seemed like it should've been easy especially when i learned about HTTP Live Streaming (HLS). iOS and Safari are my primary targets and so that is where the efforts are being made. surprisingly, everywhere else, this works pretty well.

for chrome, i use [Native HLS Playback](https://chrome.google.com/webstore/detail/native-hls-playback/emnphkkblegpebimobpbekeedfgemhof/related) and load up the m3u8 file and it works really well.

## how to use this

first, you'll need an http server. you can use nginx or something like [`serve`](https://www.npmjs.com/package/serve) because the script that runs `ffmpeg` just outputs static files. load up the m3u8 file in a web browser or VLC and it should start playing.
