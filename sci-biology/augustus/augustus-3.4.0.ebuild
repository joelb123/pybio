# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils toolchain-funcs

DESCRIPTION="Eukaryotic gene predictor"
HOMEPAGE="https://bioinf.uni-greifswald.de/augustus
	https://github.com/Gaius-Augustus/Augustus"
SRC_URI="https://github.com/Gaius-Augustus/Augustus/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples man mysql sqlite"

RDEPEND="
	sci-biology/bamtools
	>=sci-mathematics/lpsolve-5.5
	sci-libs/gsl
	sci-libs/suitesparse
	sqlite? ( dev-db/sqlite:3 )
	mysql? ( dev-db/mysql++ )
	>=dev-libs/boost-1.49.0
	sys-libs/zlib"
DEPEND="${RDEPEND}
	sys-devel/flex"
S="${WORKDIR}/Augustus-${PV}"

src_prepare() {
	# TODO: do we need anything from the 2.5.5 patch?
	# epatch "${FILESDIR}"/${P}-sane-build.patch
	default
	tc-export CC CXX
	# lets respect upstream's wish and keep -ggdb
	sed -e 's#-ggdb -O3#-ggdb#' -i src/Makefile || die
	# get rid of bam2wig
	sed -e '/bam2wig/d' -i auxprogs/Makefile || die
	# enable comparative gene prediction (CGP, needs c++11 compiler),
	#    this needs sci-mathematics/lpsolve
	sed -e 's/^# COMPGENEPRED/COMPGENEPRED/' -i common.mk || die
	# enable compressed gzip input
	sed -e 's/^#ZIPINPUT/ZIPINPUT/' -i common.mk || die
	# comparative (multi-species, CGP) AUGUSTUS with MySQL or SQLite
	#    supposedly pick only either a single-one
	if use mysql; then
		sed -e 's/^#MYSQL/MYSQL/' -i common.mk || die
	elif use sqlite; then
		# comparative (mutli-species, CGP) AUGUSTUS with SQLite
		sed -e 's/^# SQLITE/SQLITE/' -i common.mk || die
	fi
	# respect $EPREFIX in all Makefile's
	find . -name Makefile | while read f; do \
		sed -s "s#/usr/include#${EPREFIX}/usr/include#g" -i $f || die;
	done
}

src_install() {
	dobin bin/*

	exeinto /usr/libexec/${PN}
	doexe scripts/*.{pl,pm,py} scripts/checkUTR
	insinto /usr/libexec/${PN}
	doins scripts/*.conf

	insinto /usr/share/${PN}
	doins -r config

	echo "AUGUSTUS_CONFIG_PATH=\"/usr/share/${PN}/config\"" > "${S}/99${PN}"
	doenvd "${S}/99${PN}"

	insinto /usr/libexec/${PN}/gbrowse
	doins scripts/gbrowse.conf
	insinto /usr/libexec/${PN}/gfftools
	doins scripts/gff2ps_mycustom # config setting

	dodoc README.md retraining.html auxprogs/homGeneMapping/README.TXT
	dodoc -r docs/*.{pdf,txt,md}

	if use examples; then
		insinto /usr/share/${PN}/
		doins -r docs/tutorial examples
	fi

	use man && doman mansrc/*.1

	# install stuff compiled but not written into bin/
	# https://github.com/Gaius-Augustus/Augustus/issues/14
	dobin auxprogs/utrrnaseq/Debug/utrrnaseq
	dodoc auxprogs/utrrnaseq/doc/reference.pdf
}
