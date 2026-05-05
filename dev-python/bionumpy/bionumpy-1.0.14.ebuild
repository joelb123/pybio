# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
PYTHON_REQ_USE='threads(+)'

inherit distutils-r1 pypi

DESCRIPTION="Array programming on biological datasets"
HOMEPAGE="https://bionumpy/github.io/bionumpy https://github.com/bionumpy/bionumpy"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
KEYWORDS="~amd64 ~arm64 x86"


LICENSE="MIT"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="test"


RDEPEND="${PYTHON_DEPS}
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/npstructures[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

