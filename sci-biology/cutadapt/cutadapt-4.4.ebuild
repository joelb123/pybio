# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Remove adapter sequences from high-throughput sequencing data"
HOMEPAGE="https://github.com/marcelm/cutadapt https://pypi.org/cutadapt"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/xopen-0.1.1[${PYTHON_USEDEP}]"
