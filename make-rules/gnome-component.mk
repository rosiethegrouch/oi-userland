#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright (c) 2016, Oracle and/or its affiliates. All rights reserved.
#

#
# This file sets up the standard, default options and base requirements for
# GNOME userland components.
#
COMPONENT_PROJECT_URL ?=	https://www.gnome.org/
COMPONENT_MAJOR_MINOR ?=	$(basename $(COMPONENT_VERSION))
ifndef COMPONENT_ARCHIVE_OVERRIDE
COMPONENT_ARCHIVE      =	$(COMPONENT_SRC).tar.xz
endif
COMPONENT_ARCHIVE_URL ?=	https://download.gnome.org/sources/$(COMPONENT_NAME)/$(COMPONENT_MAJOR_MINOR)/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB       ?=	gnome/libraries

PKGMOGRIFY_TRANSFORMS += $(WS_TOP)/transforms/gnome-incorporation

include $(WS_MAKE_RULES)/common.mk

CONFIGURE_OPTIONS += --libexecdir="$(USRLIB)"
CONFIGURE_OPTIONS += --localstatedir="$(VARDIR)"

# Some components require an architecture-specific directory for their
# configuration, so these are specified per-bits.
ETCDIR.32 ?= $(ETCDIR)
ETCDIR.64 ?= $(ETCDIR)
CONFIGURE_OPTIONS += --sysconfdir="$(ETCDIR.$(BITS))"

# configure generally requires GNU make explicitly.
CONFIGURE_ENV += MAKE=$(MAKE)

CONFIGURE_ENV += INTLTOOL_PERL="$(PERL)"

# Tell g-ir-scanner not to cache results in homedir of user running the build
COMPONENT_BUILD_ENV += GI_SCANNER_DISABLE_CACHE=""

