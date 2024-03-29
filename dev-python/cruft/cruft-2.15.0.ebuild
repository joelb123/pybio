# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 optfeature pypi

DESCRIPTION="Maintain Cookiecutter cruft"
HOMEPAGE="https://github.com/cruft/cruft/ https://pypi.org/project/cruft"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/GitPython[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	>=dev-util/cookiecutter-1.6[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/examples[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

