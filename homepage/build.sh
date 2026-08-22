#!/bin/sh

set -xe
set -o pipefail

apt-get install -y git

version="%%VERSION%%"
node_version="22"

export SHELL=/bin/bash
export HOME=/root

curl -Lo- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install ${node_version}

export COREPACK_ENABLE_DOWNLOAD_PROMPT=0 && \
git clone https://github.com/gethomepage/homepage.git && \
cd homepage && \
git checkout tags/${version} && \
corepack enable && \
corepack prepare pnpm@latest --activate && \
pnpm install --frozen-lockfile --prefer-offline && \
env NEXT_TELEMETRY_DISABLED=1 \
  NEXT_PUBLIC_VERSION=${version} \
  NEXT_PUBLIC_REVISION=`git rev-parse HEAD` \
    pnpm run build && \
mkdir -p /homepage-files && \
cp -a public /homepage-files && \
cp -a .next/standalone/. /homepage-files && \
cp -a .next/static/. /homepage-files/.next/static && \
rm -rf /homepage-files/config && \
tar --gzip -C / -cf /homepage-${version}.tar.gz homepage-files
