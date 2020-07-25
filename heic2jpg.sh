#!/bin/sh

HEIC_IMAGE=$1

if [ -z "$HEIC_IMAGE" ]; then
    echo "Pass image name as parameter"
    exit 1
fi

JPEG_IMAGE=`echo $HEIC_IMAGE | sed 's/HEIC/jpg/'`

if [ "$JPEG_IMAGE" = "$HEIC_IMAGE" ]; then
	echo "$HEIC_IMAGE ; source and destination are the same - update script if necessary"
    exit 2
fi

echo "Converting $HEIC_IMAGE to $JPEG_IMAGE"
heif-convert $HEIC_IMAGE $JPEG_IMAGE && rm $HEIC_IMAGE && echo "Converted $HEIC_IMAGE removed"
