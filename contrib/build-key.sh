#!/bin/bash

USIGN_PATH="$1"
KEY_PATH="$(mktemp -d)"

if [ -z "$USIGN_PATH" ] || [ -z "$KEY_PATH" ]; then
	echo "Usage: $0 <usign_path> <key_path>"
	exit 1
fi

$USIGN_PATH -G -p "$KEY_PATH/public.key" -s "$KEY_PATH/private.key"

if [ -n "$GHA_PRIVATE_KEY" ] && [ -n "$GHA_PUBLIC_KEY" ]; then
	echo "GHA_PRIVATE_KEY and GHA_PUBLIC_KEY is set"

	echo "$GHA_PRIVATE_KEY" > "$KEY_PATH/private.key"
	echo "$GHA_PUBLIC_KEY" > "$KEY_PATH/public.key"
fi

USIGN_PRIVATE_KEY="$(cat $KEY_PATH/private.key)"
USIGN_PUBLIC_KEY="$(cat $KEY_PATH/public.key)"
USIGN_FINGERPRINT="$($USIGN_PATH -F -p $KEY_PATH/public.key)"

echo "usign-private-key<<EOF" >> "$GITHUB_OUTPUT"
echo "$USIGN_PRIVATE_KEY" >> "$GITHUB_OUTPUT"
echo "EOF" >> "$GITHUB_OUTPUT"

echo "usign-public-key<<EOF" >> "$GITHUB_OUTPUT"
echo "$USIGN_PUBLIC_KEY" >> "$GITHUB_OUTPUT"
echo "EOF" >> "$GITHUB_OUTPUT"

echo "usign-fingerprint<<EOF" >> "$GITHUB_OUTPUT"
echo "$USIGN_FINGERPRINT" >> "$GITHUB_OUTPUT"
echo "EOF" >> "$GITHUB_OUTPUT"

rm -rf "$KEY_PATH"