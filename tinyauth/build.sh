#!/bin/sh

set -xe
set -o pipefail

VERSION="%%VERSION%%"

apt-get install -y git unzip

export HOME=/root
curl -fsSL https://bun.com/install | bash
git clone https://github.com/steveiliop56/tinyauth.git
cd tinyauth/frontend
git checkout "tags/${VERSION}"
~/.bun/bin/bun install --frozen-lockfile
~/.bun/bin/bun run build
cp -a dist /tinyauth-frontend
tar --gzip -C / -cf "/tinyauth-${VERSION}.frontend.tar.gz" tinyauth-frontend
