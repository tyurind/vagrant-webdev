#!/bin/bash
set -e

echo ">>> Installing NODEJS"

NODE_URL_86="http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x86.tar.gz"
NODE_URL_64="http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz"


if [ "$(uname -m 2>/dev/null | grep 64)" != "" ]; then
    NODE_URL="$NODE_URL_64"
    echo ">>> NODEJS x64"
else
    NODE_URL="$NODE_URL_86"
    echo ">>> NODEJS x86"
fi


mkdir -p /usr/local/lib 
cd /usr/local/lib

if [ "$(node -v 2>/dev/null | grep 'v0')" = "" ]; then
    wget --no-check-certificate -q -O - "$NODE_URL" | tar -xzf -
    ln -s /usr/local/lib/node*/bin/node /usr/local/bin/node
    ln -s /usr/local/lib/node*/bin/npm /usr/local/bin/npm

    npm install -g less http-console
fi