#!/bin/bash -x
if [ "$SKETCH_TO_RUN" != "" ]
then
	avr-pizza compile -s ./source/$SKETCH_TO_RUN/$SKETCH_TO_RUN.ino -a uno -b ./arduino-*/
	avrgirl-arduino flash -f $SKETCH_TO_RUN.ino.hex -a uno -v
fi
chmod 666 /dev/ttyACM0
while [ true ]
do
	cu -l /dev/ttyACM0 -s 9600
	sleep 1
done