# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools 

DESCRIPTION="Chimera detection, clustering, searching, subsampling, and sorting"
HOMEPAGE="https://github.com/torognes/vsearch"
SRC_URI="https://github.com/torognes/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	sys-libs/zlib[static-libs]
	app-arch/bzip2[static-libs]
"

PATCHES=( "${FILESDIR}"/OF-macro-fix.patch 
	#"${FILESDIR}"/respect-cxxflags.patch
	)

src_prepare() {
	# Remove problematic CFLAGS and CXXFLAGS declarations
	sed -i -e '/^CFLAGS/d' Makefile.am || die
	sed -i -e '/^CXXFLAGS/d' configure.ac || die
	default
	eautoreconf
}

src_install(){
	dobin bin/vsearch
	dodoc README.md man/vsearch_manual.pdf
	doman man/vsearch.1
	default
}
