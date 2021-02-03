# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils

DESCRIPTION="Compute chains of syntenic genes"
HOMEPAGE="https://dagchainer.sourceforge.net"
SRC_URI="mirror://sourceforge/dagchainer/DAGchainer_r02-06-2008.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~x86 ~amd64"
PATCHES=(
	"${FILESDIR}"/${P}.patch
)

S="${WORKDIR}"/DAGCHAINER

src_install() {
	rm accessory_scripts/chain_to_length_ratio.pl.~1.1.~
	rm Java_XY_plotter/run_XYplot.pl.~1.1.1.1.~
	dobin dagchainer
	dobin run_DAG_chainer.pl
	dobin "${S}"/Java_XY_plotter/run_XYplot.pl
	dobin "${S}"/accessory_scripts/*
	dodoc README 
	dodoc -r "${S}"/docs/*
	insinto /usr/share/"${PN}"/lib
	doins -r "${S}"/Java_XY_plotter/lib/*
}
