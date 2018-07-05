# YoutubeDownloader

YoutubeDownloader is a shell script to download videos from YouTube.com and lets you easily convert files.

## Getting Started

### Prerequisites

[Youtube-dl](https://github.com/rg3/youtube-dl) and [FFmpeg](https://www.ffmpeg.org/) should be installed and available in your PATH

### Installing

Download [shell script file](https://raw.githubusercontent.com/kakmond/YoutubeDownloader/master/command.sh) or
```
curl https://raw.githubusercontent.com/kakmond/YoutubeDownloader/master/command.sh > command.sh
```

### Running
```
command.sh [file] [OPTIONS]
```

### Options
    -o [directory]     Output file name directory
    -f [format]        Specify audio or video format: currently supported
                        "best", "aac","flac", "mp3", "m4a", "opus", "vorbis",
                        "wav", "mp4", "flv", "ogg", "webm", "mkv", "avi"
                        
### Example
```
./command.sh sampleURLs.txt -f mp3 -o "/outputDir/"
```
