# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_SETUPTOOLS="manual"

inherit distutils-r1 pypi

DESCRIPTION="access Python object elements as both keys and attributes"
HOMEPAGE="https://pypi.org/project/attrdict3/
		https://github.com/pirofti/AttrDict3"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv s390 sparc x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

DEPEND="
	dev-python/setuptools:0[${PYTHON_USEDEP}]
"
