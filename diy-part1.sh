#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Add luci-app-adguardhome
git clone https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome

# Add Netmap
git clone https://github.com/Ausaci/luci-app-netmap package/netmap

# Add Nat6-helper
git clone https://github.com/Ausaci/luci-app-nat6-helper.git package/luci-app-nat6-helper

# Add helloworld fw876
git clone https://github.com/fw876/helloworld package/helloworld

# Add helloworld_Copy (V2ray-core version 180-10 at Nov 28, 2020)
# git clone https://github.com/Ausaci/helloworld_Copy.git package/helloworld-copy

# Add luci-app-vssr
# git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
# git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

# Add luci-app-shadowsocks
# git clone https://github.com/shadowsocks/luci-app-shadowsocks.git package/luci-app-shadowsocks

# Add ServerChan (Added in lean/luci)
# git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

# Add luci-app-socat (Added in lean/luci)
# svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-socat package/luci-app-socat

# Add Aliddns
# git clone https://github.com/Ausaci/luci-app-aliddns package/aliddns

# Modify Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

# Delete .svn
sudo find package/ -type d -iname ".svn" | sudo xargs rm -rf $1
