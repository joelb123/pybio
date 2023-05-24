# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit toolchain-funcs python-single-r1

DESCRIPTION="Genome-scale comparison of biological sequences"
HOMEPAGE="http://gitlab.com/mcfrith/last"
SRC_URI="http://gitlab.com/mcfrith/${PN}/-/archive/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND=""

src_configure() {
	tc-export CC CXX
}

src_install() {
	local DOCS=( doc/*.txt doc/*.rst )
	einstalldocs
	cd bin || die
	dobin *
}
