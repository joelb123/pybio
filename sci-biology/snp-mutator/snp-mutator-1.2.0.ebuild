EAPI=7
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
DESCRIPTION="Generate mutated sequence files from a reference genome."
HOMEPAGE="https://github.com/CFSAN-Biostatistics/snp-mutator"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~x86"

