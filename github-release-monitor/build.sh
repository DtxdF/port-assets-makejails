#!/bin/sh

set -xe
set -o pipefail

version="%%VERSION%%"

apt-get install -y git

export HOME=/root
export NEXT_TELEMETRY_DISABLED=1
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24
git clone https://github.com/iamspido/github-release-monitor.git
cd github-release-monitor
git checkout tags/${version}
npm ci
BETTER_AUTH_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \
BETTER_AUTH_URL=http://localhost:3000 \
npm run build
cp -a .next/standalone /github-release-monitor-files
cp -a .next/static /github-release-monitor-files/.next
cp -a public /github-release-monitor-files
tar --gzip -C / -cf /github-release-monitor-${version}.tar.gz github-release-monitor-files
