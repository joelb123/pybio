# automatically generated by g-sorcery
# please do not edit this file

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="k-mer analysis toolkit and programming library."
HOMEPAGE="https://kpal.readthedocs.io"
LICENSE="MIT"
SRC_URI="https://github.com/LUMC/kPAL/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DISTUTILS_USE_SETUPTOOLS=rdepend

SLOT="0"
KEYWORDS="~amd64 ~x86"

