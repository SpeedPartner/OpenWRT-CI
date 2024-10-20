#!/bin/bash

if [[ $WRT_REPO == *"lede"* ]]; then
        sed -i '/^#src-git luci https:\/\/github.com\/coolsnowwolf\/luci$/s/^#//' ./wrt/feeds.conf.default
        sed -i '/^src-git luci https:\/\/github.com\/coolsnowwolf\/luci\.git;openwrt-23\.05$/s/^/#/' ./wrt/feeds.conf.default

	echo "$WRT_REPO LuCI version has been downgraded to 18.06!"
fi

if [[ $WRT_REPO == *"immortalwrt"* ]]; then
cat <<EOF >> ./wrt/package/network/config/firewall/files/firewall.config

config include 'socat'
	option type 'script'
	option path '/var/etc/socat.include'

config include 'miniupnpd'
	option type 'script'
	option path '/usr/share/miniupnpd/firewall.include'
EOF

	echo "$WRT_REPO patch has been installed!"
fi
