#!/bin/bash

echo "===== start build ffmpeg-emcc ====="

NOW_PATH=$(cd $(dirname $0); pwd)

WEB_CAPTURE_PATH=$(cd $NOW_PATH/../; pwd)

FFMPEG_PATH=$(cd $WEB_CAPTURE_PATH/../ffmpeg-4.4.1; pwd)

source $WEB_CAPTURE_PATH/../emsdk/emsdk_env.sh

rm -rf  $WEB_CAPTURE_PATH/lib/ffmpeg-emcc

mkdir $WEB_CAPTURE_PATH/lib/ffmpeg-emcc

cd $FFMPEG_PATH

make clean

emconfigure ./configure \
    --prefix=$WEB_CAPTURE_PATH/lib/ffmpeg-emcc \
    --cc="emcc" \
    --cxx="em++" \
    --ar="emar" \
    --cpu=generic \
    --target-os=none \
    --arch=x86_32 \
    --enable-gpl \
    --enable-version3 \
    --enable-cross-compile \
    --disable-logging \
    --disable-programs \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-doc \
    --disable-swresample \
    --disable-postproc  \
    --disable-avfilter \
    --enable-pthreads \
    --enable-w32threads \
    --enable-os2threads \
    --disable-network \
    --disable-asm \
    --disable-debug

make -j4

make install

echo "===== finish build ffmpeg-emcc ====="