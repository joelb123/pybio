# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit python-single-r1

DESCRIPTION="Utilities for variant calling and manipulating VCF and BCF files"
HOMEPAGE="https://www.htslib.org"
SRC_URI="https://github.com/samtools/${PN}/releases/download/${PV}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	dev-lang/perl
	=sci-libs/htslib-1.13*:=
	sys-libs/zlib:=
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

#PATCHES=(
#	"${FILESDIR}"/${PN}-1.5-buildsystem.patch
#	"${FILESDIR}"/${PN}-1.9-fix-shebangs.patch
#)

src_prepare() {
	default

	python_fix_shebang misc/{guess-ploidy,plot-roh}.py

	# remove bundled htslib
	rm -r htslib-* || die
}

src_configure() {
	econf \
		--disable-bcftools-plugins \
		--disable-libgsl \
		--disable-configure-htslib \
		--with-htslib=system
}
