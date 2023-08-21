#!/usr/bin/env bash
PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin

# actual battery level
BATT=$(ioreg -c AppleDeviceManagementHIDEventService -r -l | grep -i mouse -A 20 | grep BatteryPercent | cut -d= -f2 | cut -d' ' -f2)

# defaults to warn at 20%; accepts other number as 1st argument (useful for testing)
COMPARE=${1:-20}

if [ -z "$BATT" ]; then
  echo 'No mouse found.'
  exit 0
fi

BOT_ID="YOUR_BOT_ID"
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

if (( BATT < COMPARE )); then
  MSG="Batteria%20mouse%20scarica,%20livello%20${BATT}%%21"
  URL="https://api.telegram.org/bot${BOT_TOKEN}:${BOT_ID}/sendMessage?chat_id=${CHAT_ID}&text=${MSG}"

  curl "$URL"
  osascript -e "display notification \"Mouse battery is at ${BATT}%.\" with title \"Mouse Battery Low\""
fi
