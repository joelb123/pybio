EAPI=7
PYTHON_COMPAT=( python3_{6..10} )

inherit distutils-r1 git-r3

DESCRIPTION="A utility to convert and transform biological sequence data"
HOMEPAGE="https://fhcrc.github.com/taxtastic/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fhcrc/taxtastic.git"
LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE="test"
#PATCHES="${FILESDIR}/setup_print.patch"
DEPEND="dev-python/setuptools
        dev-python/pyflakes
	test? ( dev-python/nose )"

src_test() {
	PYTHONPATH=. "${python}" setup.py nosetests || die "tests failed"
}

