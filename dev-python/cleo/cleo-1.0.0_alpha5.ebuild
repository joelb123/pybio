# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python tool for building testable command-line interfaces"
HOMEPAGE="
	https://github.com/python-poetry/cleo/
	https://pypi.org/project/cleo/
"
MY_PV="$(ver_cut 1-3)a$(ver_cut 5)"
SRC_URI="
	https://github.com/python-poetry/cleo/archive/${MY_PV}.tar.gz
		-> ${P}.tar.gz
"
S="${WORKDIR}/cleo-${MY_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="
	>=dev-python/crashtest-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/rapidfuzz-2.2.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
