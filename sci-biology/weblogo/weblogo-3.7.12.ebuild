# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="generate consensus sequence logo figures"
HOMEPAGE="http://weblogo.threeplusone.com/ https://github.com/WebLogo/weblogo"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/scipy
"
BDEPEND="
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
