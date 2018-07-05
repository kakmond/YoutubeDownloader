if [ ! -f "${1}" ]; then
    	echo "Input file doesn't exist: ${1}"
  	exit 1
fi

path="$1"
shift

audioFormat=("best" "acc" "flac" "mp3" "m4a" "opus" "vorbis" "wav")
videoFormat=("mp4" "flv" "ogg" "webm" "mkv" "avi")
targetDirectory="${PWD}"
targetFormat=mp4
isVideo=true

while getopts ":f:o:" opt; do
  case $opt in
    f)
	if [[ " ${audioFormat[@]} " =~ " ${OPTARG} " ]]; then
		targetFormat=${OPTARG}
		isVideo=false
	elif [[ " ${videoFormat[@]} " =~ " ${OPTARG} " ]]; then
		targetFormat=${OPTARG}
	else
		echo "Invalid format: $OPTARG"
		exit 1
	fi
      	;;
    o)
	targetDirectory=$OPTARG
	;;
    \?)
      	echo "Invalid option: -$OPTARG"
	exit 1
    	;;
  esac
done

if [ ! -d "$targetDirectory" ]; then
    	echo "Output directory doesn't exist: ${targetDirectory}"
  	exit 1
fi

printf "================================================================\nRead URLs from: ${path}\nOutput format: ${targetFormat}\n"
printf "Output directory: %s" "${targetDirectory}"
printf "\n================================================================\n"

while IFS='' read -r line || [[ -n "$line" ]]; do
   	echo "URL: $line"
	if [ $isVideo ]; then
		youtube-dl -x --audio-format $targetFormat $line -o "$targetDirectory\%(title)s.%(ext)s"
	else
		youtube-dl -x --recode-video $targetFormat $line -o "$targetDirectory\%(title)s.%(ext)s"
	fi
	printf "\n================================================================\n"
done < "$path"
