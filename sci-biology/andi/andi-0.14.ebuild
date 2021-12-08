EAPI="7"

inherit eutils autotools

DESCRIPTION="Estimate phylogenetic distance of related genomes"
HOMEPAGE="https://github.com/evolbioinf/andi/"
SRC_URI="https://github.com/evolbioinf/andi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
IUSE=""
KEYWORDS="amd64"
LICENSE="GPL-3"

DEPEND="dev-libs/libdivsufsort
        sci-libs/gsl"

src_prepare() {
	default
	eautoreconf
}
