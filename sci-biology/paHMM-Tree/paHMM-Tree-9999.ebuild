# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit toolchain-funcs

if [ "$PV" == "9999" ]; then
	inherit git-r3
fi

DESCRIPTION="Phylogenetic tree estimation using pair HMMs"
HOMEPAGE="https://marbogusz.github.io/paHMM-Tree "
if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="https://github.com/marbogusz/paHMM-Tree.git"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-biology/bowtie"

#src_compile(){
#	cd AlignGraph || die
#	$(tc-getCXX) ${CXXFLAGS} -o AlignGraph AlignGraph.cpp -lpthread
#	cd ../Eval-AlignGraph || die
#	$(tc-getCXX) ${CXXFLAGS} -o Eval-AlignGraph Eval-AlignGraph.cpp -lpthread
#}

src_install(){
	dobin paHMM-tree
	dodoc README LICENSE
}
