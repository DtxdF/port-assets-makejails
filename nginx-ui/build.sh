#!/bin/sh

set -xeu
set -o pipefail

VERSION="%%VERSION%%"

apt-get install -y git unzip

export HOME=/root
export PATH="${PATH}:${HOME}/.bun/bin"

curl -fsSL https://bun.com/install | bash

git clone https://github.com/0xJacky/nginx-ui.git

cd nginx-ui/app

git checkout "tags/${VERSION}"

bun install
bun run build

cp -a dist /nginx-ui-frontend
tar --gzip -C / -cf /nginx-ui-%%VERSION%%.frontend.tar.gz nginx-ui-frontend
