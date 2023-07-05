# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=no
RESTRICT="test"

inherit distutils-r1 optfeature

DESCRIPTION="Pymol ScrIpt COllection"
HOMEPAGE="https://github.com/speleo3/pymol-psico/"
SRC_URI="https://github.com/speleo3/pymol-psico/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="BSD-2"

S="${WORKDIR}/pymol-psico-${PV}"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	sci-biology/biopython[${PYTHON_USEDEP}]
    sci-chemistry/modeller[${PYTHON_USEDEP}]
    sci-chemistry/pymol[${PYTHON_USEDEP}]
"

python_compile() {
    python_domodule psico 
}

pkg_postinst() {
	optfeature "secondary structure assignment" sci-chemistry/dssp
	optfeature "alternate sec structure assignment" sci-biology/stride
	optfeature "maximum-likelihood superpositioning" sci-chemistry/theseus
	optfeature "Delaunay triangularization" media-libs/qhull
	optfeature "movie creation" media-video/mplayer
	optfeature "normal modes" sci-chemistry/pdbmat
	optfeature "chemoinformatics" sci-chemistry/rdkit
	optfeature "eigenvector calculation" sci-mathematics/diagrtb
	optfeature "surface calculation" sci-chemistry/msms-bin
	# TMscore
	# MMTK - ancient
	# CSB - also ancient
	# prody - still ancient
	# indigo - no build
	# DynDom - no build
	# apbs - no build, license
	# pdb2pqr - ancient, no build
	# prosmart - no build
	# p_sstruc3 - no build
}
