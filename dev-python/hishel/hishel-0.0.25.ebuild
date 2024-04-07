# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Persistent cache implementation for httpx and httpcore"
HOMEPAGE="
	https://hishel.com/
	https://github.com/karpetrosyan/hishel/
	https://pypi.org/project/hishel/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest

