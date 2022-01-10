
#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
if type "xrandr";then
    for m in $(/usr/bin/xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar example -r >>/tmp/polybar.log 2>&1 &
    done
else
    polybar example -r >>/tmp/polybar.log 2>&1 &
fi
#polybar bar2 >>/tmp/polybar2.log 2>&1 &

echo "Bars launched..."
