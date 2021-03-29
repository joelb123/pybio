# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit eutils flag-o-matic toolchain-funcs

DESCRIPTION="A suite of algorithms for ecological bioinformatics"
HOMEPAGE="https://www.mothur.org/"
SRC_URI="https://github.com/mothur/mothur/archive/refs/tags/v.${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="boost readline gsl"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sci-biology/uchime
	boost? ( dev-libs/boost[static-libs] sys-libs/zlib[static-libs] )
	gsl? ( sci-libs/gsl[static-libs] )
	readline? ( sys-libs/readline[static-libs] )
	"
DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}"/${PN}-v.${PV}

pkg_setup() {
	export OPTIMIZE=yes
	use readline && export USEREADLINE=yes || export USEREADLINE=no
	use boost && export USEBOOST=yes || export USEBOOST=no
	use gsl && export USEGSL=yes || export USEGSL=no
	export MOTHUR_TOOLS="/usr/bin"
	export MOTHUR_FILES="/usr/share/mothur"
}

src_prepare() {
	sed -i 's/subdirs :=/subdirs := source/' Makefile || die "Unable to edit Makefile"
	sed -i 's|wildcard \*.c|wildcard source/\*.c|' Makefile || die "Unable to edit Makefile"
	sed -i 's|#include <sys/sysctl.h>||' source/mothur.h
	default
}

src_install() {
	dobin ${PN}
	default
}
