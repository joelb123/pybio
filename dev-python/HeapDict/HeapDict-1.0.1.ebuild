# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Heap with decrease-key and increase-key operations"
HOMEPAGE="https://stutzbachenterprises.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
DISTUTILS_USE_SETUPTOOLS=rdepend

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
