# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Read and write Generic Feature Format (GFF) with Biopython"
HOMEPAGE="https://pypi.python.org/project/bcbio-gff"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"
RESTRICT="test"
S="${WORKDIR}/${P}"

LICENSE="HPND" # same as biopython
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"
