# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit eutils flag-o-matic toolchain-funcs

DESCRIPTION="A suite of algorithms for ecological bioinformatics"
HOMEPAGE="https://www.mothur.org/"
SRC_URI="https://github.com/mothur/mothur/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="mpi readline zlib hdf5 gsl"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/boost
	sci-biology/uchime
	gsl? ( sci-libs/gsl )
	hdf5? ( sci-libs/hdf5 )
	readline? ( sys-libs/readline )
	zlib? ( sys-libs/zlib )
	mpi? ( virtual/mpi )
	"
DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}"/${PN}-v.${PV}

pkg_setup() {
	export OPTIMIZE=yes
	use mpi && export CXX=mpicxx || export CXX=$(tc-getCXX)
	use amd64 && append-cppflags -DBIT_VERSION
	use readline && export USEREADLINE=yes || export USEREADLINE=no
	export USEBOOST=yes
	use zlib && export USECOMPRESSION=yes || export USECOMPRESSION=no
	use gsl && export USEGSL=yes || export USEGSL=no
	use hdf5 && export USEHDF5=yes || export USEHDF5=no
	export MOTHUR_TOOLS="/usr/bin"
	export MOTHUR_FILES="/usr/share/mothur"
}

src_prepare() {
	sed -i 's/subdirs :=/subdirs := source/' Makefile || die "Unable to edit Makefile"
	sed -i 's|wildcard \*.c|wildcard source/\*.c|' Makefile || die "Unable to edit Makefile"
	sed -i 's|#include <sys/sysctl.h>||' source/mothur.h
	default
}

src_compile() {
	emake USEMPI=$(usex mpi) USEREADLINE=$(usex readline) USEBOOST=yes  \
		USECOMPRESSION=$(usex zlib) USEGSL=$(usex gsl) USEHDF5=$(usex hdf5) 
}

src_install() {
	dobin ${PN}
}
