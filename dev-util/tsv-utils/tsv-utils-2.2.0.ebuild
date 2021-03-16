# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit eutils bash-completion-r1

DESCRIPTION="Command line utilities for tabular data files"
HOMEPAGE="https://ebay.github.io/tsv-utils https://github.com/eBay/tsv-utils"
SRC_URI="https://github.com/eBay/tsv-utils/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="Boost-1.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
       dev-lang/ldc2
"
RDEPEND="${DEPEND}"

src_compile() {
	# The next line should have LDC_LTO_RUNTIME=1
	# but I was having trouble with gold
	emake DCOMPILER=ldc2 LDC_PGO=2 DFLAGS="${LDCFLAGS}"
}

src_install() {
	dobin bin/*
	dobin ${FILESDIR}/tsv-field
	dobin ${FILESDIR}/tsv-header
	dobin ${FILESDIR}/tsv-sort
    dodoc README.md LICENSE.txt NOTICES.txt
	dobashcomp bash_completion/${PN}
	bashcomp_alias  \
		${PN} \
		csv2tsv number-lines tsv-append tsv-filter tsv-join \
		tsv-pretty tsv-sample tsv-select tsv-summarize tsv-uniq
}
