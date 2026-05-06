#!/bin/sh
set -e

KEYGEN=/opt/xcel_itron2mqtt/scripts/generate_keys.sh

case "${1:-}" in
    print-lfdi)
        exec "${KEYGEN}" -n
        ;;
    generate-keys)
        exec "${KEYGEN}"
        ;;
esac

"${KEYGEN}" -n

exec python3 -Wignore main.py
