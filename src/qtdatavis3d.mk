# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtdatavis3d
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 1bff85dcdeed98ad8f0e191f77e7c0e9d57af719c51791044b9c15e939b800f8
$(PKG)_SUBDIR    = $(subst qtbase,qtdatavis3d,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtdatavis3d,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtdatavis3d,$(qtbase_URL))
$(PKG)_DEPS     := gcc qtbase qtdeclarative qtmultimedia

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
