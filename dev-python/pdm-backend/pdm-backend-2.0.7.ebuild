# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{10..11} pypy3 )

inherit distutils-r1

DESCRIPTION="A PEP 517 backend for PDM that supports PEP 621 metadata"
HOMEPAGE="
	https://pypi.org/project/pdm-backend/
	https://github.com/pdm-project/pdm-backend/
"
SRC_URI="
	https://github.com/pdm-project/pdm-backend/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND="
	>=dev-python/packaging-21.3-r2[${PYTHON_USEDEP}]
	dev-python/pyproject-metadata[${PYTHON_USEDEP}]
	>=dev-python/tomli-2[${PYTHON_USEDEP}]
	dev-python/tomli-w[${PYTHON_USEDEP}]
	dev-python/validate-pyproject[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	test? (
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-vcs/git
	)
"
# setuptools are used to build C extensions
RDEPEND+="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	rm -r src/pdm/backend/_vendor || die
	find -name '*.py' -exec sed \
		-e 's:from pdm\.backend\._vendor\.:from :' \
		-e 's:from pdm\.backend\._vendor ::' \
		-i {} + || die
	distutils-r1_src_prepare
}

src_test() {
	git config --global user.email "test@example.com" || die
	git config --global user.name "Test User" || die
	distutils-r1_src_test
}
