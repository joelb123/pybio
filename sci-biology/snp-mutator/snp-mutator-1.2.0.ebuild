EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Generate mutated sequence files from a reference genome."
HOMEPAGE="https://github.com/CFSAN-Biostatistics/snp-mutator https://pypi.org/project/snp-mutator"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"
LICENSE="BSD"
S="${WORKDIR}/${P}"

SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
