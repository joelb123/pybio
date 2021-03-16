# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit cmake

DESCRIPTION="Next-gen Burrows-Wheeler Alignment"
HOMEPAGE="https://github.com/bwa-mem2/bwa-mem2"
SRC_URI="https://github.com/bwa-mem2/bwa-mem2/releases/download/v${PV}/Source_code_including_submodules.tar.gz  -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86 ~x64-macos"

RDEPEND=""
#S="${WORKDIR}"/Source_code_including_submodules/${P}

PATCHES=( ${FILESDIR}/safestringlib.patch )
DOCS=( NEWS.md README-ori.md README.md )

src_install() {
	dobin bwa-mem2
	einstalldocs
}
