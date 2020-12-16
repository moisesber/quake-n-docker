#!/usr/bin/env bash

GAME_DIR=${GAME_DIR:-id1}
MAP=${MAP:-e2m5}
CONFIG_FILE=${CONFIG_FILE:-ctfcoord.cfg}
ZONE=${ZONE:-1024}
DEDICATED=${DEDICATED:-16}

./darkplaces-linux-686-dedicated -dedicated ${DEDICATED} -game ${GAME_DIR} -condebug -nojoy -zone ${ZONE} +exec ${CONFIG_FILE} map ${MAP}
