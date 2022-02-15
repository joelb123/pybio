# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( pypy3 python3_{8..10} )
inherit distutils-r1

MY_PV=${PV/_alpha/a}
DESCRIPTION="Poetry PEP 517 Build Backend"
HOMEPAGE="https://pypi.org/project/poetry-core/ https://github.com/python-poetry/poetry-core"
SRC_URI="
	https://github.com/python-poetry/poetry-core/archive/${MY_PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

# check inside src/poetry/core/_vendor/vendor.txt
RDEPEND=""
BDEPEND="
	test? (
		dev-python/pep517[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# Those "fail" bacause of glob file path resulting from newer versions
	# in our tree than vendored. But those don't affect anything.
	tests/masonry/builders/test_sdist.py::test_default_with_excluded_data
	tests/masonry/builders/test_wheel.py::test_default_src_with_excluded_data
)

S="${WORKDIR}/${PN}-${MY_PV}"
