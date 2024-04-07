# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Persistent cache implementation for httpx and httpcore"
HOMEPAGE="
	https:/pbs-installer.readthedocs.io/
	https://github.com/frostming/pbs-installer/
	https://pypi.org/project/pbs-installer/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/zstandard[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest

