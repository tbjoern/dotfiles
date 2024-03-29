#!/bin/bash

echo "$HEADPHONES_BLE_ADDR"

if [ -z "$HEADPHONES_BLE_ADDR" ]; then
    echo "Headphones not configured. Set the HEADPHONES_BLE_ADDR env var to your headphones' bluetooth address."
    exit 1
fi

if bluetoothctl info "$HEADPHONES_BLE_ADDR" | grep "Connected" | grep "yes" > /dev/null ; then
    bluetoothctl disconnect "$HEADPHONES_BLE_ADDR"
fi

bluetoothctl power on && bluetoothctl connect "$HEADPHONES_BLE_ADDR"
