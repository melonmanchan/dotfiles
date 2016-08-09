#!/bin/sh

# if we don't have a file, start at zero
if [ ! -f "/tmp/i3-bar-state.dat" ] ; then
  value='dock'

# otherwise read the value from the file
else
  value=`cat /tmp/i3-bar-state.dat`
fi

if [ "$value" = "dock" ]
then
    value='invisible'
else
    value='dock'
fi

i3 bar mode $value

echo "${value}" > /tmp/i3-bar-state.dat
