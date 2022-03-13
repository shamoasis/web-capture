#!/bin/bash

echo "===== start build ffmpeg ====="

NOW_PATH=$(cd $(dirname $0); pwd)

WEB_CAPTURE_PATH=$(cd $NOW_PATH/../; pwd)

FFMPEG_PATH=$(cd $WEB_CAPTURE_PATH/../ffmpeg-4.4.1; pwd)

rm -rf $WEB_CAPTURE_PATH/lib/ffmpeg4

cd $FFMPEG_PATH

./configure \
    --prefix=$WEB_CAPTURE_PATH/lib/ffmpeg4 \
    --enable-gpl \
    --enable-version3 \
    --enable-static \
    --disable-programs \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-doc

make -j4

make install

echo "===== finish build ffmpeg ====="