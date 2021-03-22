# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools
DESCRIPTION="Custom compression for CRAM and other genomic formats"
HOMEPAGE="https://www.htslib.org/ https://github.com/samtools/htscodecs"
SRC_URI="https://github.com/samtools/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0/2"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="static-libs"

RDEPEND="
	app-arch/libdeflate
	sys-libs/zlib:=
	app-arch/bzip2:="
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf -f
	default
}

src_install() {
	default
	if ! use static-libs; then
		find "${D}" -name '*.a' -delete || die
	fi
}
