# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Wrapper for Aaron Quinlan's BEDtools, plus other useful methods for working"
HOMEPAGE="https://daler.github.io/pybedtools/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="sci-biology/bedtools"
DEPEND="${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]"


python_compile() {
	${EPYTHON} setup.py cythonize || die
	distutils-r1_python_compile
}
