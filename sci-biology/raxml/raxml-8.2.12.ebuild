# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils flag-o-matic toolchain-funcs

DESCRIPTION="Maximum-Likelihood Inference of Phylogenetic Trees"
HOMEPAGE="https://sco.h-its.org/exelixis/web/software/raxml/index.html"
SRC_URI="https://github.com/stamatak/standard-RAXML/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE="cpu_flags_x86_sse3 cpu_flags_x86_avx cpu_flags_x86_avx2 +threads mpi hybrid"

REQUIRED_USE="cpu_flags_x86_sse3"

DEPEND="
       mpi? ( >=virtual/mpi-2.0-r4 )
       hybrid? ( >=virtual/mpi-2.0-r4 )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/standard-RAxML-${PV}"


src_compile() {
	if use cpu_flags_x86_avx2; then
		hardware=".AVX2"
	elif use cpu_flags_x86_avx; then
		hardware=".AVX"
	elif use cpu_flags_x86_sse3; then
		hardware=".SSE3"
	else
		hardware=""
	fi

	if use hybrid; then
		threads=".HYBRID"
	elif use mpi; then
		threads=".MPI"
	elif use threads; then
		threads=".PTHREADS"
	else
		threads=""
	fi

	emake -f Makefile${hardware}${threads}.gcc 
}

src_install() {
	if use cpu_flags_x86_avx2; then
		hardware="-AVX2"
	elif use cpu_flags_x86_avx; then
		hardware="-AVX"
	elif use cpu_flags_x86_sse3; then
		hardware="-SSE3"
	else
		hardware=""
	fi

	if use hybrid; then
		threads="-HYBRID"
	elif use mpi; then
		threads="-MPI"
	elif use threads; then
		threads="-PTHREADS"
	else
		threads=""
	fi

	mv raxmlHPC${threads}${hardware} raxmlHPC || die
	dobin raxmlHPC usefulScripts/*
    dodoc README manual/NewManual.pdf
}
