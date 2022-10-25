# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Awk extended with sequence file support"
HOMEPAGE="https://github.com/lh3/bioawk"
SRC_URI="https://github.com/lh3/bioawk/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
	mv awk.1 bioawk.1
	doman bioawk.1
}
