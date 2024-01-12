# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit cmake distutils-r1

SLOT="0"
DESCRIPTION="Library for structural biology"
HOMEPAGE="https://gemmi.readthedocs.org/"
SRC_URI="https://github.com/project-gemmi/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Mozilla-2.0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		dev-libs/pegtl
		dev-libs/pocketfft
		dev-python/pybind11[${PYTHON_USEDEP}]
		sys-libs/zlib
"
RDEPEND="${DEPEND}"
RESTRICT="test"
PATCHES="${FILESDIR}/gemmi-0.6.4-systemlibs.patch"

src_prepare() {
	cd $S
	#rm -r include/gemmi/third_party/tao include/gemmi/third_party/pocketfft_hdronly.h third_party/zlib || die
	rm -r include/gemmi/third_party/pocketfft_hdronly.h third_party/zlib || die
	cmake_src_prepare
}

src_configure(){
	local mycmakeargs=(
			-DUSE_PYTHON=1
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}
