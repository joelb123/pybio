# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="GFF file reading"
HOMEPAGE="https://github.com/COMBINE-lab/RapMap"
SRC_URI="https://github.com/COMBINE-lab/${PN}/archive/salmon-v${PV}.tar.gz -> ${P}.tar.gz "

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""


DEPEND="
	dev-util/ninja
	app-arch/xz-utils
	app-arch/bzip2
	app-arch/unzip
	dev-libs/libdivsufsort
	sci-biology/jellyfish
	dev-libs/cereal
	dev-libs/jemalloc
"
RDEPEND="${DEPEND}"
PATCHES=( ${FILESDIR}/libdivsufsort.patch )
S="${WORKDIR}/${PN}-salmon-v${PV}"

