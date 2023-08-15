# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit cmake distutils-r1 git-r3

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
		dev-util/meson
		dev-util/ninja
"
RDEPEND="${DEPEND}"
RESTRICT="test"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local emesonargs=(
			-DENABLE_GFX=off
			-DENABLE_INFO=off
			-DCOMPILE_TMTOOLS=on
			-DUSE_NUMPY=on
			-DCOMPOUND_LIB=/tmp/openstructure
			-DPYTHON_MODULE_PATH=/usr/lib/python3.11/site-packages
	)
	cmake_src_configure
}

src_test() {
	meson_src_test
}
