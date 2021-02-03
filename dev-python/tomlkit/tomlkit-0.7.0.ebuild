# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend
inherit distutils-r1

DESCRIPTION="Style preserving TOML library"
HOMEPAGE="https://github.com/sdispater/tomlkit"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
BDEPEND="
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
PATCHES=(
	"${FILESDIR}"/${P}-no-test-package.patch
)
RDEPEND="${BDEPEND}
"

