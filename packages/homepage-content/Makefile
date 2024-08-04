include $(TOPDIR)/rules.mk

PKG_NAME:=homepage-content
PKG_VERSION:=$(shell git show -s --format=%cd --date=short)
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Build/Prepare
endef

define Build/Compile
endef

define Package/homepage-content
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+homepage-core
  TITLE:=Homepage packet content
endef

define Package/homepage-content/install
	$(INSTALL_DIR) $(1)/usr/share/homepage-content

	$(CP) -r ./files/* $(1)/usr/share/homepage-content
endef

$(eval $(call BuildPackage,homepage-content))