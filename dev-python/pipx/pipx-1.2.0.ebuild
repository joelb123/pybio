# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Install and run  Python applications in isolated environments"
HOMEPAGE="https://pipa.github.io/pipx/ https://github.com/pypa/pipx/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pipa/${PN}"
else
    SRC_URI="https://github.com/pypa/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~amd64-fbsd ~amd64-linux ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-linux"
fi

LICENSE="MIT"
SLOT="0"
RESTRICT="test"
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/userpath[${PYTHON_USEDEP}]
"
BDEPEND=""
