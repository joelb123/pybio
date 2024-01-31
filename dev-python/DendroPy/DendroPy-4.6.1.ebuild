EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="A library for phylogenetics and phylogenetic computing."

HOMEPAGE="
	https://pypi.org/project/DendroPy
	https://dendropy.org"
LICENSE="BSD"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN^}" "${PV}")"
S=${WORKDIR}/${P^}	
SLOT="0"
KEYWORDS="~amd64 ~x86"

