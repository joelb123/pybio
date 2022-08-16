# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="Openstructure.org structure characterization tools"
HOMEPAGE="https://openstructure.org/"
SRC_URI="https://git.scicore.unibas.ch/schwede/-/archive/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		dev-libs/boost
		dev-cpp/eigen
		sys-libs/zlib
		dev-db/sqlite
		dev-util/meson
		dev-util/ninja
"
RDEPEND="${DEPEND}"


src_configure(){
	local emesonargs=(
			-DENABLE_GFX=off
			-DENABLE_INFO=off
			-DCOMPILE_TMTOOLS=on
			-DUSE_NUMPY=on
			-DCOMPOUND_LIB=/tmp/openstructure
	)
	cmake_src_configure
}

src_test() {
	meson_src_test
}
