# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

SLOT="0"
DESCRIPTION="C++ math library for dense and sparse arithmetic"
HOMEPAGE="https://bitbucket.org/blaze-lib/blaze"
SRC_URI="https://bitbucket.org/blaze-lib/blaze/downloads/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""
		#dev-python/pybind11[${PYTHON_USEDEP}]

DEPEND="
		sys-libs/zlib
"
RDEPEND="${DEPEND}"

