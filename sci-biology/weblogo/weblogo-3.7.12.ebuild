# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1 pypi

DESCRIPTION="generate consensus sequence logo figures"
HOMEPAGE="http://weblogo.threeplusone.com/ https://github.com/WebLogo/weblogo https://pypi.org/project/weblogo"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

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
