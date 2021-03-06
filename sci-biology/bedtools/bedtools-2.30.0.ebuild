# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic toolchain-funcs 

DESCRIPTION="Tools for manipulation and analysis of BED, GFF/GTF, VCF, SAM/BAM file formats"
HOMEPAGE="https://bedtools.readthedocs.io/"
SRC_URI="https://github.com/arq5x/${PN}2/releases/download/v${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="${PYTHON_DEPS}
	test? (
		sci-libs/htslib
		sci-biology/samtools:0
	)"
RDEPEND="sys-libs/zlib"

S="${WORKDIR}/${PN}2"
DOCS=( README.md LICENSE )
#PATCHES=( "${WORKDIR}/${P}-fix-buildsystem.patch" )

src_configure() {
	append-lfs-flags
	export prefix="${EPREFIX}/usr"
	tc-export AR CXX
}

src_install() {
	default

	insinto /usr/share/${PN}
	doins -r data
	doins -r genomes
}
