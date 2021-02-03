# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/psipred/psipred-3.5.ebuild,v 1.2 2014/05/14 12:07:39 jlec Exp $

EAPI=5

inherit eutils prefix toolchain-funcs versionator

MY_P="${PN}.${PV}"

DESCRIPTION="Protein Secondary Structure Prediction"
HOMEPAGE="https://bioinf.cs.ucl.ac.uk/psipred/"
SRC_URI="
	httpis://bioinf.cs.ucl.ac.uk/downloads/${PN}/${MY_P}.tar.gz
	test? ( https://bioinfadmin.cs.ucl.ac.uk/downloads/psipred/old/data/tdbdata.tar.gz )"

LICENSE="psipred"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	app-shells/tcsh
	|| ( sci-biology/ncbi-tools++ sci-biology/ncbi-blast+ ) "
DEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	rm -f bin/*
	epatch "${FILESDIR}"/4.01-unified.patch 
	eprefixify runpsipred*
	emake -C src clean
}

src_compile() {
	emake -C src CC=$(tc-getCC)
}

src_install() {
	emake -C src DESTDIR="${D}" install
	dobin runpsipred* bin/* BLAST+/runpsipred*
	insinto /usr/share/${PN}
	doins -r data
	dodoc README
}

pkg_postinst() {
	elog "Please use the update_blastdb.pl in order to"
	elog "maintain your own local blastdb"
}
