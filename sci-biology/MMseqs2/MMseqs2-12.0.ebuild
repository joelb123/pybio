# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_MAKEFILE_GENERATOR="emake"

inherit eutils cmake

DESCRIPTION="Ultra fast and sensitive search and clustering suite"
HOMEPAGE="https://github.com/soedinglab/MMseqs2"
MY_PV="113e3"
FULL_PV="113e3212c137d026e297c7540e1fcd039f6812b1"
SRC_URI="https://github.com/soedinglab/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	app-shells/bash-completion
	sys-libs/zlib
	app-arch/zstd
	app-arch/bzip2
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${FULL_PV}"


src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DGIT_SHA1=${PV}
	)
	cmake_src_configure
}

src_install(){
	cmake_src_install
	insinto /usr/share/bash-completion/completions/
	mv util/bash-completion.sh util/mmseqs
	doins util/mmseqs
	rm -r "$D"/usr/util/
}
