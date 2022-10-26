# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit flag-o-matic autotools

MY_PV="4.0.0beta2"
DESCRIPTION="A rapid whole genome aligner"
HOMEPAGE="https://github.com/mummer4/mummer"
SRC_URI="https://github.com/mummer4/mummer/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
IUSE="doc"
KEYWORDS="amd64 x86"

DEPEND="dev-lang/perl
        dev-lang/yaggo"

S="${WORKDIR}/mummer-${MY_PV}"

src_prepare() {
	eautoreconf || die
 	default
	#epatch \
	#	"${FILESDIR}"/${PV}-prll.patch \
	#	"${FILESDIR}"/${PV}-ldflags.patch
}

src_compile() {
	emake || die
	cd scripts/; emake dnadiff mapview mummerplot nucmer2xfig promer ||die
	cd ..; mv annotate mummer-annotate || die
	sed -i 's|$bindir/annotate|$bindir/mummer-annotate|' scripts/run-mummer1.sh || die
}

src_install() {
	dobin combineMUMs delta-filter dnadiff exact-tandems mgaps missing mummer mummer-annotate mummerplot nucmer postnuc postpro prepro promer repeat-match show-aligns show-coords show-diff show-snps show-tiling ||die
	insinto /usr/share/${PN}/scripts
	doins scripts/{*.awk,*.sh,dnadiff,mapview,mummerplot,nucmer2xfig,promer} || die
	insinto /usr/share/${PN}/lib
	doins scripts/Foundation.pm || die

	dodoc ACKNOWLEDGEMENTS ChangeLog README.md || die
	insinto /usr/share/doc/${PF}
	if use doc; then
		doins -r docs || die
	fi
}
