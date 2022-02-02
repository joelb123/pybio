# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )
#DISTUTILS_USE_SETUPTOOLS="pyproject.toml"
inherit distutils-r1

DESCRIPTION="Cross-platform tool for adding locations to the user PATH"
HOMEPAGE="https://github.com/ofek/userpath"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"


LICENSE="Apache-2.0 MIT"
SLOT="0"
IUSE="test"
KEYWORDS="~amd64 ~ppc64 ~x86"

DEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
RDEPEND="${DEPEND}"

python_prepare_all(){
	use !test && rm tests/__init__.py
	distutils-r1_python_prepare_all
}
