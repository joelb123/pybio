EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 git-r3

DISTUTILS_USE_PEP517=setuptools
DESCRIPTION="A utility to convert and transform biological sequence data"
HOMEPAGE="https://fhcrc.github.com/taxtastic/"
EGIT_REPO_URI="https://github.com/fhcrc/taxtastic.git"
LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE="test"
DEPEND="
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/DendroPy[${PYTHON_USEDEP}]
	dev-python/fastalite[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
	dev-python/psycopg[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/sqlparse[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	"

