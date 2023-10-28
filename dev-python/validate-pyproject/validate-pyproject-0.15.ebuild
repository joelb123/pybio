# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="Validation library and CLI tool for pyproject files"
HOMEPAGE="
	https://github.com/abravalheri/validate-pyproject/
	https://pypi.org/project/validate-pyproject/
"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"
S="${WORKDIR}/${P}"

LICENSE="Mozilla-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~ia64 ~loong ppc ppc64 ~riscv ~s390 ~sparc x86"

RDEPEND="
	dev-python/fastjsonschema[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			>=dev-python/tomli-1.0.0[${PYTHON_USEDEP}]
		' 3.{8..10})
	)
"

distutils_enable_tests pytest
