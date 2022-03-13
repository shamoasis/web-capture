#!/bin/bash

echo "===== start build ffmpeg ====="

NOW_PATH=$(cd $(dirname $0); pwd)

WEB_CAPTURE_PATH=$(cd $NOW_PATH/../; pwd)

FFMPEG_PATH=$(cd $WEB_CAPTURE_PATH/../ffmpeg-3.4.8; pwd)

rm -rf $WEB_CAPTURE_PATH/lib/ffmpeg

cd $FFMPEG_PATH

./configure \
    --prefix=$WEB_CAPTURE_PATH/lib/ffmpeg

make -j4

make install

echo "===== finish build ffmpeg ====="