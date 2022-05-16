#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================


##补充汉化       
cp -f ./feeds/liwenwu1058/files/udpxy.lua ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi
cp -f ./feeds/liwenwu1058/files/mwan3.po ./feeds/luci/applications/luci-app-mwan3/po/zh-cn
              
##配置ip等
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3| ; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
# sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

##替换K3无线驱动为69027
# rm -rf ./package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
# svn export https://github.com/xiangfeidexiaohuo/Phicomm-K3_Wireless-Firmware/trunk/brcmfmac4366c-pcie.bin_69027 ./package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin


##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile


# echo '移除主页跑分信息显示'
# sed -i 's/ <%=luci.sys.exec("cat \/etc\/bench.log") or ""%>//g' package/lean/autocore/files/arm/index.htm
# echo '=========Remove benchmark display in index OK!========='

# echo '移除主页日志打印'
# sed -i '/console.log(mainNodeName);/d' package/lean/luci-theme-argon/htdocs/luci-static/argon/js/script.js
# echo '=========Remove log print in index OK!========='

echo '修改upnp绑定文件位置'
sed -i 's/\/var\/upnp.leases/\/tmp\/upnp.leases/g' feeds/packages/net/miniupnpd/files/upnpd.config
cat feeds/packages/net/miniupnpd/files/upnpd.config |grep upnp_lease_file
echo '=========Alert upnp binding file directory!========='

##加入作者信息
# sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='$(date +%Y%m%d) By YaoDao'/g" package/lean/default-settings/files/zzz-default-settings

##更改主机名
sed -i "s/hostname='.*'/hostname='Phicomm-K3'/g" package/base-files/files/bin/config_generate

##FQ全部调到VPN菜单
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-ssr-plus/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/model/cbi/passwall/api/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/view/passwall/global/*.htm
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/view/passwall/log/*.htm
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/view/passwall/rule/*.htm
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-passwall/luasrc/view/passwall/server/*.htm

# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-vssr/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-vssr/luasrc/view/vssr/*.htm

# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-openclash/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-openclash/luasrc/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-openclash/luasrc/view/openclash/*.htm

# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-bypass/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-bypass/luasrc/model/cbi/bypass/*.lua
# sed -i 's/services/vpn/g' package/feeds/liwenwu1058/luci-app-bypass/luasrc/view/bypass/*.htm


sed -i '/option Interface/d'  package/network/services/dropbear/files/dropbear.config
