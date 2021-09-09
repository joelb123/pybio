# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit meson ninja-utils

DESCRIPTION="Bayesian co-estimation of phylogenies and multiple alignments via MCMC"
HOMEPAGE="https://www.bali-phy.org/"
SRC_URI="https://github.com/bredelings/BAli-Phy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		app-text/pandoc
		dev-libs/boost
		dev-cpp/eigen
		dev-cpp/nlohmann_json
		dev-cpp/range-v3
		dev-lang/ghc
		dev-util/meson
		dev-util/ninja
		sci-visualization/gnuplot
		dev-lang/R
		dev-lang/perl
		dev-vcs/git
		sci-biology/seaview
		sci-visualization/gnuplot
		x11-libs/cairo
"
RDEPEND="${DEPEND}"


src_configure(){
	git clone https://gitlab.com/testiphy/testiphy.git
	local emesonargs=(
			-Deigen=system
			-Dboost=system
			-Djson=system
	)
	meson_src_configure
}

src_test() {
	meson_src_test
}
