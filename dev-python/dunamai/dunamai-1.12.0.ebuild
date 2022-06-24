# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

DESCRIPTION="Dynamic version generation"
HOMEPAGE="https://github.com/mtkennerly/dunamai"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
DISTUTILS_USE_SETUPTOOLS=rdepend

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
RDEPEND="${BDEPEND}
"

#PATCHES=(
#	"${FILESDIR}"/${P}-no-pinned-deps.patch
#)

python_test() {
	pytest -vv || die
}

