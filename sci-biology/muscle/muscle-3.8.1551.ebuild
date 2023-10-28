# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

MY_P="${PN}${PV}_src"

DESCRIPTION="Multiple sequence comparison by log-expectation"
HOMEPAGE="https://www.drive5.com/muscle/"
SRC_URI="https://www.drive5.com/muscle//${PN}_src_${PV}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

RDEPEND="!sci-libs/libmuscle"
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	cp "${FILESDIR}"/benchmark.fa.gz .
	gunzip benchmark.fa.gz
	cp "${FILESDIR}"/Makefile .
	tc-export CXX
	default
}

src_install() {
	dobin "${PN}"
}
