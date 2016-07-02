#!/usr/bin/env python3
#
# A battery indicator blocklet script for i3blocks

from subprocess import check_output, Popen
import os

def color(percent):
    if percent < 5:
        return "#FFFFFF"
    if percent < 10:
        return "#FF0000"
    if percent < 20:
        return "#FF3300"
    if percent < 30:
        return "#FF6600"
    if percent < 40:
        return "#FF9900"
    if percent < 50:
        return "#FFCC00"
    if percent < 60:
        return "#FFFF00"
    if percent < 70:
        return "#99FF00"
    if percent < 80:
        return "#66FF00"
    return "#33FF00"

status = check_output(['acpi'], universal_newlines=True)
state = status.split(": ")[1].split(", ")[0]
commasplitstatus = status.split(", ")
percentleft = int(commasplitstatus[1].rstrip("%\n"))

FA_CHR = "<span font='FontAwesome'></span>"
FA_DIS = "<span font='FontAwesome'>\uf078</span>"
FA_FULL = "<span font='FontAwesome'>\uf139</span>"
FA_LIGHTNING = "<span font='FontAwesome'>\uf0e7</span>"

FA_BATTERY_4 = "<span font='FontAwesome'></span>"
FA_BATTERY_3 = "<span font='FontAwesome'></span>"
FA_BATTERY_2 = "<span font='FontAwesome'></span>"
FA_BATTERY_1 = "<span font='FontAwesome'></span>"
FA_BATTERY_0 = "<span font='FontAwesome'></span>"

FA_MARKER = FA_BATTERY_4 + ' '

if percentleft < 10:
    FA_MARKER = FA_BATTERY_0
elif percentleft < 25:
    FA_MARKER = FA_BATTERY_1
elif percentleft < 50:
    FA_MARKER = FA_BATTERY_2
elif percentleft < 75:
    FA_MARKER = FA_BATTERY_3
elif percentleft < 100:
    FA_MARKER = FA_BATTERY_4

fulltext = "<span color='{}'>{}</span>".format(color(percentleft), FA_MARKER)
timeleft = state + ", time left:"
time = commasplitstatus[-1].split()[0]
time = ":".join(time.split(":")[0:2])
timeleft += " {}".format(time)

#if state == "Discharging":
#    form = ' <span color="{}">{}</span>'
#    fulltext += form.format(color(percentleft), FA_DIS)
#elif state == "Charging":
#    fulltext += " " + FA_CHR
#else:
#    fulltext += " " + FA_FULL

form =  '<span color="{}">{}%</span>'
percent_string = str(percentleft).rjust(3)
fulltext += form.format(color(percentleft), percent_string)

if os.environ.get('BLOCK_BUTTON'):
    Popen(['notify-send', timeleft])

print(fulltext)
print(fulltext)
if percentleft < 5:
    exit(33)
