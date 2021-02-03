# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils toolchain-funcs

DESCRIPTION="Whole genome association analysis toolset"
HOMEPAGE="https://pngu.mgh.harvard.edu/~purcell/plink
	https://www.cog-genomics.org/plink2/"
SRC_URI="https://github.com/chrchang/plink-ng/archive/2019.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lapack"

DEPEND="
	app-arch/unzip
	virtual/pkgconfig"
RDEPEND="
	sys-libs/zlib
	lapack? ( virtual/lapack
		virtual/cblas )"

S="${WORKDIR}/plink-ng-2019/1.9"

# Package collides with net-misc/putty. Renamed to p-link following discussion with Debian.
# Package contains bytecode-only jar gPLINK.jar. Ignored, notified upstream.


src_prepare() {
	mv Makefile.std Makefile
	default
}

src_compile() {
	local blasflags
	use lapack && blasflags="$($(tc-getPKG_CONFIG) --libs lapack blas cblas)"
	emake \
		CXX=$(tc-getCXX) \
		CFLAGS="${CFLAGS} -DDYNAMIC_ZLIB" \
		ZLIB="$($(tc-getPKG_CONFIG) --libs zlib) -lpthread" \
		BLASFLAGS="$blasflags"
}

src_install() {
	newbin plink p-link
}

pkg_postinst(){
	einfo "plink binary is now renamed to p-link to avoid file collision"
}
