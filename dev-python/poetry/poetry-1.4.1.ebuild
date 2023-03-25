# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Python dependency management and packaging made easy."
HOMEPAGE="https://python-poetry.org/ https://pypi.org/project/poetry/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
DISTUTILS_USE_PEP517=poetry

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND="
	test? (
	    dev-python/cachy[${PYTHON_USEDEP}]
		dev-python/deepdiff[${PYTHON_USEDEP}]
		dev-python/httpretty[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-randomly[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/zipp[${PYTHON_USEDEP}]
	)
	"
RDEPEND="${BDEPEND}
	~dev-python/poetry-core-1.5.2[${PYTHON_USEDEP}]
	>=dev-python/poetry-plugin-export-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/build-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/cachecontrol-0.12.9[${PYTHON_USEDEP}]
	>=dev-python/cleo-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/crashtest-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.0[${PYTHON_USEDEP}]
	>=dev-python/installer-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.10[${PYTHON_USEDEP}]
	>=dev-python/keyring-23.9.0[${PYTHON_USEDEP}]
	>=dev-python/lockfile-0.12.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.9.4[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]
	<=dev-python/requests-toolbelt-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.5[${PYTHON_USEDEP}]
	>=dev-python/setuptools-60.4[${PYTHON_USEDEP}]
	>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.6[${PYTHON_USEDEP}]
	<=dev-python/tomlkit-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/trove-classifiers-2022.5.19[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-20.11[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
"
#	>=dev-python/pyxattr-0.10.0[${PYTHON_USEDEP}] # darwin only

#src_prepare() {
#	sed -i "s/,<.*'/'/g" setup.py || die
#	default
#}

python_test() {
	pytest -vv || die
}

