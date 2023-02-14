# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1

DESCRIPTION="A simple yet effective caching library"
HOMEPAGE="https://github.com/sdispater/cachy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
RESTRICT="test"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
BDEPEND="
	dev-python/python-memcached[${PYTHON_USEDEP}]
	dev-python/redis[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
PATCHES=(
	"${FILESDIR}"/${P}-no-test-package.patch
)
RDEPEND="${BDEPEND}
"

