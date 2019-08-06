setxkbmap -option caps:ctrl_modifier
xcape -e Caps_Lock=Escape

#Fix overly sensitive touchpad
xinput --set-prop 12 "Synaptics Tap Action" 0 0 0 0 0 0 0
xinput --set-prop 12 "Synaptics Finger" 50 50 257

#Natural scroll
#This does not seem to work when setting via Gnome/gsettings
synclient VertScrollDelta=-100
synclient HorizScrollDelta=-100
