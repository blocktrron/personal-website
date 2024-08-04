#!/bin/bash


BASE_VERSION="1.0.0"

# Name of SDK
SDK_NAME="openwrt-sdk-23.05.4-x86-64_gcc-12.3.0_musl.Linux-x86_64"

# Name of Imagebuilder
IMAGEBUILDER_NAME="openwrt-imagebuilder-23.05.4-x86-64.Linux-x86_64"

# URLs
SDK_URL="https://downloads.openwrt.org/releases/23.05.4/targets/x86/64/${SDK_NAME}.tar.xz"
IMAGEBUILDER_URL="http://downloads.openwrt.org/releases/23.05.4/targets/x86/64/${IMAGEBUILDER_NAME}.tar.xz"

# Get Git short hash
GIT_SHORT_HASH="$(git rev-parse --short HEAD)"

# Get date of last Git commit 
GIT_COMMIT_DATE="$(git log -1 --format=%cd --date=format:'%Y%m%d')"

# Get branch of last Git commit
GIT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

# Use the base version as the version prefix
VERSION="$GIT_COMMIT_DATE-$GIT_SHORT_HASH-$GIT_BRANCH"

# Check if this was a push on master branch
DEPLOY="0"
if [ "$GITHUB_EVENT_NAME" = "push"  ] && [ "$GITHUB_REF_TYPE" = "branch" ] && [ $GITHUB_REF_NAME = "master" ]; then
  DEPLOY="1"
else
  # Error out, unsupported
  exit 1
fi

# Write build-meta to dedicated file before appending GITHUB_OUTPUT.
# This way, we can create an artifact for our build-meta to eventually upload to a release.
BUILD_META_TMP_DIR="$(mktemp -d)"
BUILD_META_OUTPUT="$BUILD_META_TMP_DIR/build-meta.txt"

echo "version=$VERSION" > "$BUILD_META_OUTPUT"
echo "deploy=$DEPLOY" >> "$BUILD_META_OUTPUT"
echo "sdk-name=$SDK_NAME" >> "$BUILD_META_OUTPUT"
echo "sdk-url=$SDK_URL" >> "$BUILD_META_OUTPUT"
echo "imagebuilder-name=$IMAGEBUILDER_NAME" >> "$BUILD_META_OUTPUT"
echo "imagebuilder-url=$IMAGEBUILDER_URL" >> "$BUILD_META_OUTPUT"

# Copy over to GITHUB_OUTPUT
cat "$BUILD_META_OUTPUT" >> "$GITHUB_OUTPUT"

# Display Output so we can conveniently check it from CI log viewer
cat "$GITHUB_OUTPUT"

exit 0
