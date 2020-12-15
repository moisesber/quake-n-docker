#!/usr/bin/env bash

GAME_DIR=${GAME_DIR:-modules}
MAP=${MAP:-e2m5}
CONFIG_FILE=${CONFIG_FILE:-ctfcoord.cfg}
ZONE=${ZONE:-512}
DEDICATED=${DEDICATED:-16}

./sqpro -dedicated ${DEDICATED} -game ${GAME_DIR} -condebug -nojoy -zone ${ZONE} +exec ${CONFIG_FILE} map ${MAP}
