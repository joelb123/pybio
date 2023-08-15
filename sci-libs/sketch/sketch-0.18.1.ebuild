# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_EXT=1
inherit distutils-r1

SLOT="0"
DESCRIPTION="Sketch data structures"
HOMEPAGE="https://github.com/dnbaker/sketch"
SRC_URI="https://github.com/dnbaker/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		dev-python/pybind11[${PYTHON_USEDEP}]
		sci-libs/blaze
		sys-libs/zlib
"
RDEPEND="${DEPEND}"
PATCHES=( "${FILESDIR}/${P}-setuppy.patch" )

src_prepare() {
	echo "doing patches"
	mv python/{setup.py,requirements.txt,sketch,pytest.py}  . || die
	cp "${FILESDIR}/run_tests.sh" . || die
	rm -rf include/blaze || die
	default
}

python_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
	distutils-r1_python_install
}
