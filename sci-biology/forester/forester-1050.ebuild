EAPI=8

inherit java-pkg-2

DESCRIPTION="Visualization, Analysis, and Editing of Phylogenetic Trees"
HOMEPAGE="httpis://sites.google.com/site/cmzmasek/home/software/archaeopteryx"
SRC_URI="https://www.phyloxml.org/download/${PN}/${PN}_${PV}.jar"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPS=""
DEPEND=">=virtual/jdk-1.8
        ${COMMON_DEPS}"
RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${PN}"


src_unpack() {
	mkdir "${S}" || die
	cd "${S}" || die
	unpack ${A}
	cp "${DISTDIR}"/${PN}_${PV}.jar ${PN}.jar || die
}

src_install() {
	java-pkg_dojar *.jar
    dobin ${FILESDIR}/archaeoptryx || die
	insinto /usr/share/${PN}/lib
	doins ${FILESDIR}/_aptx_configuration_file.txt || die
}
