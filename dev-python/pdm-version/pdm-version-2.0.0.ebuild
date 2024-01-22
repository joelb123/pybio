# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Make pdm version command."
HOMEPAGE="https://github.com/abersheeran/pdm-version https://pypi.org/project/pdm-version"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"
DISTUTILS_USE_PEP517=pdm

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${BDEPEND}
	>=dev-python/pdm-2.3.1[${PYTHON_USEDEP}]
"
MY_PN="pdm-version"
S="${WORKDIR}/${MY_PN}-${PV}"
