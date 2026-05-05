# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=scikit-build-core
DISTUTILS_EXT=1
inherit cmake distutils-r1

SLOT="0"
DESCRIPTION="Library for structural biology"
HOMEPAGE="https://gemmi.readthedocs.org/"
SRC_URI="https://github.com/project-gemmi/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Mozilla-2.0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/scikit-build-core[${PYTHON_USEDEP}]
		sys-libs/zlib-ng
"

RDEPEND="${DEPEND}"
RESTRICT="test"

src_prepare() {
	cd $S
	rm -r third_party/zlib || die
	cmake_src_prepare
	distutils-r1_python_src_prepare
}

python_configure(){
	local mycmakeargs=(
			-DUSE_ZLIB_NG=1
	)
	distutils-r1-python_configure
}

python_install() {
	distutils-r1_python_install
	rm -r "${D}/usr/include/gemmi/third_party" || die
}
