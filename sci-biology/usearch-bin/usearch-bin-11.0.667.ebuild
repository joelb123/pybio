EAPI=8

DESCRIPTION="High-throughput biological sequence analysis"
HOMEPAGE="https://www.drive5.com/usearch"
EXEFILE="usearch${PV}_i86linux32"
SRC_URI="${EXEFILE}.gz"
RESTRICT="fetch"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}"

pkg_no_fetch(){
	einfo "Please visit https://www.drive5.com/usearch/download.html to"
	einfo "download ${AT} for non-commercial use"
	einfo "and move it to ${DISTDIR}"
}

src_install(){
	mv $EXEFILE usearch
	dobin usearch
}
