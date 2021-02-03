# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit python-single-r1

DESCRIPTION="A versatile pairwise aligner for genomic and spliced nucleotide sequences"
HOMEPAGE="https://lh3.github.io/minimap2"
SRC_URI="https://github.com/lh3/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	sys-libs/zlib:=
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-buildsystem.patch
)

src_prepare() {
	default
	python_fix_shebang python/minimap2.py
}

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_compile() {
	default
	emake
}

src_install() {
	dobin minimap2
	doman minimap2.1
	dodoc *.md LICENSE.txt python/README.rst
	use python && dobin python/${PN}.py
}
