# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..10} )

inherit distutils-r1

DESCRIPTION="Core utilities for poetry."
HOMEPAGE="https://poetry.eustace.io/ https://github.com/python-poetry/poetry-core/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
RDEPEND="${BDEPEND}"


python_test() {
	pytest -vv || die
}

