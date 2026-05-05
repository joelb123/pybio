# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=standalone
inherit cmake git-r3 distutils-r1

SLOT="0"
DESCRIPTION="Openstructure.org structure characterization tools"
HOMEPAGE="https://openstructure.org/"
EGIT_REPO_URI="https://git.scicore.unibas.ch/schwede/openstructure.git"
#SRC_URI="https://git.scicore.unibas.ch/schwede/-/archive/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
#KEYWORDS="~amd64"
IUSE=""

DEPEND="
		dev-libs/boost
		dev-cpp/eigen
		sys-libs/zlib
		sci-libs/fftw
		media-libs/tiff
		media-libs/libpng
		dev-db/sqlite
		dev-python/numpy
		dev-python/pyqt6
		dev-python/sip
		dev-build/meson
"
RDEPEND="${DEPEND}"
RESTRICT="test"

src_prepare() {
	cmake_src_prepare
}

python_configure() {
	local emesonargs=(
			-DENABLE_GFX=on
			-DENABLE_INFO=on
			-DCOMPILE_TMTOOLS=on
			-DUSE_NUMPY=on
			-DCOMPOUND_LIB=/tmp/openstructure
	)
	cmake_src_configure
}

src_test() {
	meson_src_test
}
