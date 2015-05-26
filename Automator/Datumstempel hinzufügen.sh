NOW=$(date +"%y%m%d")
for f in "$@"
do
	SPATH=${f%/*}"/"
	FILENAME=${f##*/}
	PREFIX=${FILENAME:0:6}
	TRIM=${FILENAME:7}
	case $PREFIX in
       [0-9][0-9][0-1][0-9][0-3][0-9] )
				DESTINATION=$SPATH$NOW"_"$TRIM
                ;;
        *) 
				DESTINATION=$SPATH$NOW"_"$FILENAME
            	;;
	esac
	if [[ "$f" != "$DESTINATION" ]]; then mv "$f" "$DESTINATION"; fi
done