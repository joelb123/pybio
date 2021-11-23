# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Python dependency management and packaging made easy."
HOMEPAGE="https://poetry.eustace.io/ https://pypi.org/project/poetry/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND="
	dev-python/poetry-core[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/atomicwrites[${PYTHON_USEDEP}]
	>=dev-python/pyrsistent-0.14.2[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-20.0.1[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
	$(python_gen_cond_dep '
		dev-python/importlib_metadata[${PYTHON_USEDEP}]
		' python3_{6,7})
	>=dev-python/pyparsing-2.2[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]"
RDEPEND="${BDEPEND}
	>=dev-python/cleo-0.7.6[${PYTHON_USEDEP}]
	>=dev-python/clikit-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/cachy-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/cachecontrol-0.12.4[${PYTHON_USEDEP}]
	dev-python/crashtest[${PYTHON_USEDEP}]
	>=dev-python/entrypoints-0.3[${PYTHON_USEDEP}]
	dev-python/httpretty[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.1[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.5.11[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.9[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.4[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-1.4[${PYTHON_USEDEP}]
"
#	>=dev-python/poetry-core-1.0.0_alpha9[${PYTHON_USEDEP}]

#PATCHES=(
#	"${FILESDIR}"/${P}-no-pinned-deps.patch
#)

python_test() {
	pytest -vv || die
}

