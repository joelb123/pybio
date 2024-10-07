# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Globus SDK"
HOMEPAGE="
	https://globus-sdk-python.readthedocs.org/
	https://github.com/globus/globus-sdk-python/
	https://pypi.org/project/globus-sdk/
"
SRC_URI="
	https://github.com/globus/globus-sdk-python/archive/${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
PROPERTIES="test_network"
RESTRICT="test"

RDEPEND=">=dev-python/cryptography-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.19.1[${PYTHON_USEDEP}]
"
S="${WORKDIR}/globus-sdk-python-${PV}"
