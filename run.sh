#!/bin/bash
xhost +
sudo docker run --rm -it \
--privileged \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=unix$DISPLAY \
-v /dev/bus/usb:/dev/bus/usb \
mykali