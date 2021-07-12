# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools
DESCRIPTION="C library for high-throughput sequencing data formats"
HOMEPAGE="https://www.htslib.org/ https://github.com/samtools/htslib"
SRC_URI="https://github.com/samtools/${PN}/archive/${PV}/${P}.tar.gz"

SLOT="0/2"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="curl +lzma static-libs"

RDEPEND="
	app-arch/libdeflate
	sci-libs/htscodecs[static-libs]
	app-arch/bzip2:=
	curl? ( net-misc/curl )
	lzma? ( app-arch/xz-utils:= )"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf -f
	default
}

src_configure() {
	econf \
		--disable-gcs \
		--disable-plugins \
		--disable-s3 \
		--with-libdeflate \
		--with-external-htscodecs \
		$(use_enable curl libcurl) \
		$(use_enable lzma)
}

src_install() {
	default

	if ! use static-libs; then
		find "${D}" -name '*.a' -delete || die
	fi
}
