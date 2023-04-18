# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( pypy3 python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Allows export of locked packages to Poetry PEP 517 Build Backend"
HOMEPAGE="https://pypi.org/project/poetry-core/ https://github.com/python-poetry/poetry-core"
SRC_URI="
	https://github.com/python-poetry/poetry-plugin-export/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

# check inside src/poetry/core/_vendor/vendor.txt
RDEPEND=""
BDEPEND="
	test? (
		dev-python/poetry[${PYTHON_USEDEP}]
		dev-python/poetry-core[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest


