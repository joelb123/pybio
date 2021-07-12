# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools toolchain-funcs

DESCRIPTION="Utilities for analysing and manipulating the SAM/BAM alignment formats"
HOMEPAGE="https://www.htslib.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos"
IUSE="examples"

RDEPEND="
	dev-lang/perl
	=sci-libs/htslib-1.13*
	sys-libs/ncurses:0=
	sys-libs/zlib:=
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	# remove bundled htslib
	rm -r htslib-* || die
	eautoreconf
	default
}

src_test() {
	local -x LD_LIBRARY_PATH="${S}"
	default
}

src_install() {
	default

	# install headers and libraries
	insinto /usr/include/bam
	doins *.h
	#dolib.so libbam.so*

	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
