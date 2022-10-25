# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Efficient pythonic random access to fasta subsequences"
HOMEPAGE="https://pypi.python.org/pypi/pyfaidx https://github.com/mdshw5/pyfaidx"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REPEND="dev-python/six[${PYTHON_USEDEP}]"

distutils_enable_tests nose
