BAT_INFO_DIR="/sys/class/power_supply/BAT0"

BAT_STATUS=$(cat "$BAT_INFO_DIR/status")
BAT_LEVEL=$(cat "$BAT_INFO_DIR/capacity")

if [[ "$BAT_STATUS" != 'Discharging' ]]; then
    BAT_ICON=''
else
    if [[ "$BAT_LEVEL" > 85 ]]; then
    	BAT_ICON=''
    elif [[ "$BAT_LEVEL" > 60 ]]; then
    	BAT_ICON=''
    elif [[ "$BAT_LEVEL" > 35 ]]; then
    	BAT_ICON=''
    elif [[ "$BAT_LEVEL" > 10 ]]; then
    	BAT_ICON=''
    else
    	BAT_ICON=''
    fi
fi

echo "$BAT_ICON $BAT_LEVEL %"
