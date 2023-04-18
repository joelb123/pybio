# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="A set of tools to keep your pinned Python dependencies fresh."
HOMEPAGE="https://pypi.python.org/pypi/pip-tools"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		test? ( dev-python/nose[${PYTHON_USEDEP}] )
		doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
DISTUTILS_USE_PEP517=setuptools
#PATCHES=( "${FILESDIR}/pip-tools-6.12.0-exclude-examples.patch" )

python_compile_all() {
	rm -r tests
	use doc && emake -C docs html
}

python_test() {
	nosetests -w "${BUILD_DIR}" more_itertools --with-doctest \
		|| die "tests fail with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
