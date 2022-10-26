# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua-single

DESCRIPTION="Tools for bioinformatics (Tallymer, Readjoiner, gff3validator, ...)"
HOMEPAGE="https://genometools.org"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cairo"

DEPEND="
	${LUA_DEPS}
	dev-libs/glib
	cairo? ( x11-libs/cairo x11-libs/pango )
	sci-biology/samtools
	dev-db/sqlite:3
	dev-lang/lua
	dev-lua/lpeg
	dev-lua/luafilesystem
	dev-lua/md5
	dev-lang/luajit
	dev-libs/tre
	sys-libs/zlib
	app-arch/bzip2
	dev-libs/expat
	sci-libs/htslib
	"
BDEPEND="virtual/pkgconfig"
RDEPEND="${DEPEND}"
RESTRICT="test"
PATCHES=( "${FILESDIR}"/1.6.2-system-lua.patch )

pkg_setup() {
	lua-single_pkg_setup
}


src_compile(){
	local myemakeargs=( useshared=yes errorcheck=no )
	! use cairo && myemakeargs+=( cairo=no )
	emake ${myemakeargs}
}
