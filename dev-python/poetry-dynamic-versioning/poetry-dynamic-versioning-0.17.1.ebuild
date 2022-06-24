# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

DESCRIPTION="Plugin for Poetry to enable dynamics versioning based on VCS tags"
HOMEPAGE="https://github.com/mtkennerly/poetry-dynamic-versioning"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
	dev-python/poetry[${PYTHON_USEDEP}]
"
RDEPEND="${BDEPEND}
	dev-python/dunamai[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
"

#PATCHES=(
#	"${FILESDIR}"/${P}-no-pinned-deps.patch
#)

python_test() {
	pytest -vv || die
}
