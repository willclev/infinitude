#!/bin/bash

# Generate the config file from environment variables
echo "{\"app_secret\":\"$APP_SECRET\",\"pass_reqs\":$PASS_REQS,\"serial_tty\":\"$SERIAL_TTY\",\"serial_socket\":\"$SERIAL_SOCKET\"}" > /infinitude_2/infinitude.json

if [ -z ${MODE+x} ]; then
	echo "MODE is not set.  Defaulting to Production";
	MODE=Production
else
	echo "MODE is set to $MODE";
fi

cd /infinitude_2 && ./infinitude_2 daemon -m $MODE
