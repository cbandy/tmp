#!/bin/sh -e

[ -n "$ORACLE_COOKIE" ] || { echo "Missing ORACLE_COOKIE environment variable!"; exit 1; }
[ -n "$ORACLE_FILE" ] || { echo "Missing ORACLE_FILE environment variable!"; exit 1; }

if [ -n "$ORACLE_DOWNLOAD_DIR" ]; then
  mkdir -p "$ORACLE_DOWNLOAD_DIR"
  export ORACLE_DOWNLOAD_DIR="$(readlink -f "$ORACLE_DOWNLOAD_DIR")/"
fi

cd "$(dirname "$(readlink -f "$0")")"

npm install bluebird node-phantom-simple

export COOKIES='cookies.txt'
export USER_AGENT='Mozilla/5.0'

echo > "$COOKIES"
chmod 600 "$COOKIES"

exec node download.js
