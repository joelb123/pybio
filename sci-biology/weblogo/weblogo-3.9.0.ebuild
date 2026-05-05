# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=no
inherit distutils-r1

DESCRIPTION="generate consensus sequence logo figures"
HOMEPAGE="http://weblogo.threeplusone.com/ https://github.com/gecrooks/weblogo https://pypi.org/project/weblogo"
SRC_URI="https://github.com/gecrooks/weblogo/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/numpy
	dev-python/scipy
"
BDEPEND="
	dev-python/setuptools-scm
	test? (
		app-text/ghostscript-gpl
		dev-python/mypy
	)
"

distutils_enable_tests pytest

python_test() {
	distutils_install_for_testing
	pytest -vv || die "tests failed with ${EPYTHON}"
}
