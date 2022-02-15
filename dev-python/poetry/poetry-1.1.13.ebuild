# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Python dependency management and packaging made easy."
HOMEPAGE="https://python-poetry.org/ https://pypi.org/project/poetry/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND="
	test? (
		dev-python/httpretty[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
	"
RDEPEND="${BDEPEND}
	~dev-python/poetry-core-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/cachecontrol-0.12.9[${PYTHON_USEDEP}]
	>=dev-python/cachy-0.3.0[${PYTHON_USEDEP}]
	~dev-python/cleo-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/clikit-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/crashtest-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-21.2.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.1[${PYTHON_USEDEP}]
	>=dev-python/setuptools-60.4[${PYTHON_USEDEP}]
	<dev-python/setuptools-60.7[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.7[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-20.11[${PYTHON_USEDEP}]
"

src_prepare() {
	sed -i "s/,<.*'/'/g" setup.py || die
	default
}

python_test() {
	pytest -vv || die
}

