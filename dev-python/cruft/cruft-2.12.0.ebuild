# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..11} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 optfeature

DESCRIPTION="Maintain Cookiecutter cruft"
HOMEPAGE="https://github.com/cruft/cruft/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/GitPython[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/importlib_metadata[${PYTHON_USEDEP}]
	>=dev-util/cookiecutter-1.6[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/examples[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

