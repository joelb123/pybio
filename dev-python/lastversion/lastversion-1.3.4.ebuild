# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} pypy3 )

inherit distutils-r1

DESCRIPTION="A CLI tool to fetch last GitHub release version"
HOMEPAGE="https://pypi.org/project/lastversion/"
SRC_URI="https://github.com/dvershinin/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DISTUTILS_USE_SETUPTOOLS=rdepend

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~ia64 ppc ppc64 sparc x86"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/CacheControl[${PYTHON_USEDEP}]
	dev-python/lockfile[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/beautifulsoup[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

distutils_enable_tests pytest
