# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..10} )

inherit distutils-r1

DESCRIPTION="CLIs based on type hints."
HOMEPAGE="https://typer.tiangolo.com https://github.com/tiangolo/typer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
DISTUTILS_USE_SETUPTOOLS=rdepend

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
	)
"
RDEPEND="${BDEPEND}
	>=dev-python/colorama-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.3.0[${PYTHON_USEDEP}]
"

python_test() {
	pytest -vv || die
}

