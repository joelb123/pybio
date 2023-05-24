# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Python tools to manipulate graphs and complex networks"
HOMEPAGE="https://gffpandas.readthedocs.io/ https://github.com/foerstner-lab/gffpandas"
SRC_URI="mirror://pypi/${PN:0:1}/gffpandas-jb/gffpandas-jb-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
IUSE="examples test doc"


COMMON_DEPEND="
	>=dev-python/pandas-0.23.3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${COMMON_DEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
	)"
RDEPEND="
	${COMMON_DEPEND}
	"
S="${WORKDIR}"/gffpandas-jb-${PV}

python_test() {
	pytest tests/pytest.ini || die
}

