# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} pypy3 )

inherit distutils-r1

DESCRIPTION="Validation library and CLI tool for pyproject files"
HOMEPAGE="
	https://github.com/abravalheri/validate-pyproject/
	https://pypi.org/project/validate-pyproject/
"
SRC_URI="
	https://github.com/abravalheri/validate-pyproject/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

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
