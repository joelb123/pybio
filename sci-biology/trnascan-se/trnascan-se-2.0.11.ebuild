EAPI=8

inherit perl-functions

DESCRIPTION="tRNA detection in large-scale genome sequences"
HOMEPAGE="https://lowelab.ucsc.edu/tRNAscan-SE/"
SRC_URI="https://github.com/UCSC-LoweLab/tRNAscan-SE/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}"/tRNAscan-SE-${PV}/

src_test() {
	emake PATH="${S}:${PATH}" testrun
}

src_install() {
	dobin tRNAscan-SE
	dobin bin/covels-SE bin/coves-SE bin/eufindtRNA bin/EukHighConfidenceFilter bin/fasta2gsi bin/sstofa bin/trnascan-1.4
	dodoc README 
	insinto /usr/share/${PN}/
	doins tRNAscan-SE.conf tRNAscan-SE.src
	insinto /usr/share/${PN}/models/
	doins lib/models/*
	insinto /usr/share/${PN}/gcode
	doins lib/gcode/*
	perl_domodule -r lib/tRNAscanSE || die
}
