#!/bin/sh

# Get the current layer of the focused node
LAYER=$(bspc query -T -n | jq -r .client.layer)

NEWLAYER=normal
if [ $LAYER = 'normal' ]; then
	NEWLAYER=below
elif [ $LAYER = 'below' ]; then
	NEWLAYER=above
fi
notify-send -t 1000 "$LAYER → $NEWLAYER"
# Apply new ratio
bspc node $NODE -l $NEWLAYER
