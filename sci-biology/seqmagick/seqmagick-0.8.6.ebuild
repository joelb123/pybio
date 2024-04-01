EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Tools for converting and modifying sequence files from the command-line"
HOMEPAGE="https://github.com/fhcrc/seqmagick https://pypi.org/project/seqmagick"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
DEPEND=""
