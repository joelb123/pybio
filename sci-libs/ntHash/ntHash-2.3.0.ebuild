# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

SLOT="0"
DESCRIPTION="Hash function for DNA sequences"
HOMEPAGE="https://github.com/bcgsc/ntHash"
SRC_URI="https://github.com/bcgsc/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		sys-libs/zlib
"
RDEPEND="${DEPEND}"

