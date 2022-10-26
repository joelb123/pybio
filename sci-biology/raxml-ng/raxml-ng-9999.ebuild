# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Next-generation maximum-likelihood inference of phylogenetic trees"
HOMEPAGE="https://github.com/amkozlov/raxml-ng"
EGIT_REPO_URI="https://github.com/amkozlov/${PN}.git"

inherit cmake git-r3

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	sys-devel/bison
	sys-devel/flex
	dev-libs/gmp
"
DEPEND="${RDEPEND}"

src_install(){
	dodoc README.md LICENSE.txt
	dobin bin/raxml-ng
}
