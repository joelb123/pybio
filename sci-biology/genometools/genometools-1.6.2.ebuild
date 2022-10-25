# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tools for bioinformatics (Tallymer, Readjoiner, gff3validator, ...)"
HOMEPAGE="https://genometools.org"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cairo"

DEPEND="
	dev-libs/glib
	cairo? ( x11-libs/cairo x11-libs/pango )
	sci-biology/samtools
	dev-db/sqlite:3
	dev-lang/lua
	dev-lua/lpeg
	dev-lua/luafilesystem
	dev-lua/lua-md5
	dev-lang/luajit
	dev-libs/tre
	sys-libs/zlib
	app-arch/bzip2
	dev-libs/expat
	sci-libs/htslib
	"
RDEPEND="${DEPEND}"

src_prepare(){
	sed -e "s#/usr/local#"${EPREFIX}"/usr#g" -i Makefile || die
	#sed -e "s#/usr/include/bam#${EPREFIX}/usr/include/bam-0.1-legacy#" -i Makefile || die
	#sed -e "s#-lbam#-lbam-0.1-legacy#" -i Makefile || die
	eapply_user
}

src_compile(){
	#local myemakeargs=( useshared=yes )
	! use cairo && myemakeargs+=( cairo=no )
	use x86 && myemakeargs+=( 32bit=yes 64bit=no )
	emake ${myemakeargs}
}
