#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2017 Aurelien Larcher
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME= libXfont2
COMPONENT_VERSION= 2.0.2
COMPONENT_SUMMARY= libXfont2 - library for X servers and utilities to access font files
COMPONENT_PROJECT_URL = http://xorg.freedesktop.org
COMPONENT_CLASSIFICATION = System/X11
COMPONENT_FMRI= x11/library/libxfont2
COMPONENT_SRC= $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE= $(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_URL= \
  http://xorg.freedesktop.org/archive/individual/lib/$(COMPONENT_ARCHIVE)
COMPONENT_ARCHIVE_HASH= \
  sha256:94088d3b87f7d42c7116d9adaad155859e93330c6e47f5989f2de600b9a6c111
COMPONENT_LICENSE = MIT
COMPONENT_LICENSE_FILE = COPYING

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) && autoreconf -f -i)

#LD_OPTIONS += -M $(COMPONENT_DIR)/mapfile-vers

CONFIGURE_LIBDIR.32 = /usr/lib/xorg
CONFIGURE_LIBDIR.64 = /usr/lib/xorg/$(MACH64)

CONFIGURE_OPTIONS += --enable-freetype
CONFIGURE_OPTIONS += --enable-fc
CONFIGURE_OPTIONS += --enable-builtins
CONFIGURE_OPTIONS += --with-bzip2

CONFIGURE_ENV += LIB_MAN_SUFFIX=3xfont2

build: $(BUILD_32_and_64)

install: $(INSTALL_32_and_64)

# Build dependencies
REQUIRED_PACKAGES += x11/header/xproto
REQUIRED_PACKAGES += x11/header/fontsproto
REQUIRED_PACKAGES += x11/library/xtrans

# Auto-generated dependencies
REQUIRED_PACKAGES += compress/bzip2
REQUIRED_PACKAGES += library/zlib
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/freetype-2
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += x11/library/libfontenc
