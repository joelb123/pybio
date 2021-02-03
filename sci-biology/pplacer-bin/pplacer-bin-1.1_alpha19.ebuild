EAPI=7

DESCRIPTION="Maximum-likelihood placement of query sequences on a fixed reference tree"
HOMEPAGE="https://matsen.fhcrc.org/pplacer/"
SRC_URI="https://github.com/matsen/pplacer/releases/download/v1.1.alpha19/pplacer-linux-v1.1.alpha19.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/pplacer-Linux-v1.1.alpha19

src_install(){
	dobin guppy
	dobin pplacer
	dobin rppr
	insinto /opt/pplacer
	doins scripts/*
}
