# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="A free open-source cross-platform bioinformatics software"
HOMEPAGE="https://ugene.unipro.ru https://github.com/ugeneunipro/ugene"
SRC_URI="https://github.com/ugeneunipro/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cpu_flags_x86_sse2"

# http://ugene.net/download.html states Qt5.4 and QtWebkit but:
#   Project MESSAGE: Cannot build Unipro UGENE with Qt version 4.8.7
#   Project ERROR: Use at least Qt 5.2.1.
DEPEND="
	>=dev-qt/qtgui-5.2.1
	>=dev-qt/qtscript-5.2.1[scripttools]
	>=dev-qt/qtwebsockets-5.2.1"
RDEPEND="${DEPEND}"

LANGS="cs en ru zh"

src_configure() {
	local CONFIG_OPTS
	if use amd64; then
		CONFIG_OPTS+=( CONFIG+="x64" )
	elif use ppc; then
		CONFIG_OPTS+=( CONFIG+="ppc" )
	fi

	use cpu_flags_x86_sse2 && CONFIG_OPTS+=( use_sse2 )
	# The following plugins won't compile --JB
	rm -r src/plugins/enzymes src/plugins/dotplot src/plugins/dna_stat || die 
	sed -i '/enzymes/d' CMakeLists.txt || die
	sed -i '/dotplot/d' CMakeLists.txt || die
	sed -i '/dna_stat/d' CMakeLists.txt || die
	sed -i '/enzymes/d' ugene.pro || die
	sed -i '/dotplot/d' ugene.pro || die
	sed -i '/dna_stat/d' ugene.pro || die
	eqmake5 $CONFIG_OPTS || die
#	sed -i -e 's/-fPIC/-fPIC -fpermissive/'  src/libs_3rdparty/breakpad/Makefile.Release || die
}


src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${ED}" install
}
