#!/bin/bash

pull () {
	cd "$(dirname "${BASH_SOURCE[0]}")"
	git pull
}

nc -k -l -p ${HOOK_PORT:-9001} | grep --line-buffered 'POST /' | while read line; do pull; done
