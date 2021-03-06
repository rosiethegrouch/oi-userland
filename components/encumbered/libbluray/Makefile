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
# Copyright 2016 phorcys@126.com.  All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME= libbluray
COMPONENT_VERSION= 1.0.1
COMPONENT_FMRI = library/video/libbluray
COMPONENT_CLASSIFICATION = System/Multimedia Libraries
COMPONENT_SUMMARY= An open-source library designed for Blu-Ray Discs playback for media players.
COMPONENT_SRC= $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE= $(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH= \
  sha256:0f9f9a1db2f48cafc70ed2596ff3594b597e2027408f5f2be6191c245d67853a
COMPONENT_ARCHIVE_URL= \
  ftp://ftp.videolan.org/pub/videolan/libbluray/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL = http://www.videolan.org/developers/libbluray.html
COMPONENT_LICENSE = LGPLv2.1

include $(WS_MAKE_RULES)/encumbered.mk
include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

COMMON_BUILD_ENV += JDK_HOME="$(JAVA_HOME)" 

CFLAGS += -I $(JAVA_HOME)/include/solaris

CONFIGURE_OPTIONS += --datadir=$(USRSHARELIBDIR)
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --enable-udf
CONFIGURE_OPTIONS += --with-libxml2
CONFIGURE_OPTIONS += --with-freetype

build: $(BUILD_32_and_64)

install: $(INSTALL_32_and_64)

test: $(TEST_32_and_64)

REQUIRED_PACKAGES += library/libxml2
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/fontconfig
REQUIRED_PACKAGES += system/library/freetype-2
