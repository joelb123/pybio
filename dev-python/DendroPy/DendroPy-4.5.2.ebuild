EAPI=8
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
DESCRIPTION="A library for phylogenetics and phylogenetic computing."

HOMEPAGE="https://dendropy.org"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~x86"

