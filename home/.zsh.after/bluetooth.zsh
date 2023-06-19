if type bluetoothctl >/dev/null 2>&1; then 
   btconnect() {
      local DEVICE=$(bluetoothctl devices | fzf | awk '{print $2}')
      bluetoothctl connect $DEVICE
   }
fi
