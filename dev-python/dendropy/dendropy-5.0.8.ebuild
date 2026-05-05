EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A library for phylogenetics and phylogenetic computing."

HOMEPAGE="
	https://pypi.org/project/DendroPy
	https://dendropy.org"
LICENSE="BSD"
SRC_URI="https://github.com/jeetsukumaran/DendroPy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/DendroPy-${PV}"
SLOT="0"
KEYWORDS="~amd64 ~x86"

