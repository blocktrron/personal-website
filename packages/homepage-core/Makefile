include $(TOPDIR)/rules.mk

PKG_NAME:=homepage-core
PKG_VERSION:=$(shell git show -s --format=%cd --date=short)
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Build/Prepare
endef

define Build/Compile
endef

define Package/homepage-core
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Core package for Homepage
endef

define Package/homepage-core/install
	$(INSTALL_DIR) $(1)/usr/share/homepage-core/config $(1)/usr/share/homepage-core/contrib $(1)/etc/uci-defaults

	$(CP) ./files/config/* $(1)/usr/share/homepage-core/config
	$(CP) ./files/contrib/* $(1)/usr/share/homepage-core/contrib
	$(INSTALL_BIN) ./files/scripts/install-config.sh $(1)/usr/share/homepage-core/
	$(INSTALL_BIN) ./files/scripts/uci-defaults.sh $(1)/etc/uci-defaults/99_uci-defaults.sh
endef

$(eval $(call BuildPackage,homepage-core))