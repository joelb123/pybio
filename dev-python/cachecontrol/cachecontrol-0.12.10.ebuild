# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

MY_PN="CacheControl"

DESCRIPTION="httplib2 caching for requests"
HOMEPAGE="https://github.com/ionrock/cachecontrol"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="test"
BDEPEND="
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
S="${WORKDIR}/${MY_PN}-${PV}"
RDEPEND="${BDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/lockfile[${PYTHON_USEDEP}]
	dev-python/redis-py[${PYTHON_USEDEP}]
"
