EAPI=7


inherit toolchain-funcs

DESCRIPTION="Genome-scale comparison of biological sequences"
HOMEPAGE="httpis://last.cbrc.jp/"
SRC_URI="https://last.cbrc.jp/${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="app-arch/unzip"

src_configure() {
	tc-export CC CXX
}

src_install() {
	local DOCS=( doc/*.txt ChangeLog.txt README.txt )
	local HTML_DOCS=( doc/*html )
	einstalldocs

	dobin src/lastdb src/lastal src/last-split src/last-merge-batches \
		src/last-pair-probs src/lastdb8 src/lastal8 src/last-split8

	cd scripts || die
	dobin *
}
