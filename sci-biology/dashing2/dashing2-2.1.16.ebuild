# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

SLOT="0"
DESCRIPTION="Toolkit for k-mer and minimizer operations"
HOMEPAGE="https://github.com/dnbaker/dashing2/"
SRC_URI="https://github.com/dnbaker/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		dev-libs/libfmt
		sci-biology/bonsai
		sci-biology/libBigWig
"
RDEPEND="${DEPEND}"
RESTRICT="test"

src_configure(){
	local emesonargs=(
			-DUSE_PYTHON=1
	)
	cmake_src_configure
}

#src_test() {
#	meson_src_test
#}
