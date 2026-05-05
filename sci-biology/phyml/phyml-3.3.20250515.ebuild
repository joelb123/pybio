# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/phyml/phyml-2.4.5-r1.ebuild,v 1.2 2010/07/16 09:54:58 fauli Exp $

EAPI=8

inherit autotools toolchain-funcs 

DESCRIPTION="Estimation of large phylogenies by maximum likelihood"
HOMEPAGE="https://github.com/stephaneguindon/phyml/"
SRC_URI="https://github.com/stephaneguindon/phyml/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN}-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	einfo "preparing package"
	libtoolize --copy --force
    eaclocal || die
	eautoheader || die
	eautoconf || die
	eautomake || die
}

src_compile() {
	econf || die
	emake || die
}

src_install() {
	dobin src/phyml || die
	#dodoc doc/phyml_manual.pdf || die
	#dodoc README || die
}
