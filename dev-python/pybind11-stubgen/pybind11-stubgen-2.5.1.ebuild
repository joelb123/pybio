# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

MY_PN="pybind11-stubgen"
DESCRIPTION="PEP 561 type stubs generator for pybind11 modules"
HOMEPAGE="https://github.com/sizmailov/pybind11-stubgen"
SRC_URI="$(pypi_sdist_url --no-normalize "${MY_PN}" "${PV}")"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/pybind11[${PYTHON_USEDEP}]
"
S="${WORKDIR}/${MY_PN}-${PV}"
