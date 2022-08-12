#!/usr/bin/env bash

SHIM_BROWSER=${SHIM_BROWSER:-firefox}
SHIM_TMP_DIR=${SHIM_TMP_DIR:-${HOME}/tmp/snap_shim_browser}

set -e

umask 0077

if [ -n "$1" ]; then
	WRAPPER_PATH="${1:7}"
	WRAPPER=$(basename ${WRAPPER_PATH})
	mkdir -p ${SHIM_TMP_DIR}

	cp ${WRAPPER_PATH} ${SHIM_TMP_DIR}
	${SHIM_BROWSER} ${SHIM_TMP_DIR}/${WRAPPER}	

else
	echo "Run with launcher file."
fi

