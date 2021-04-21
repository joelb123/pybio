# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Visualization of transcriptomes"
HOMEPAGE="https://github.com/pavlin-policar/openTSNE"
SRC_URI="https://github.com/pavlin-policar/openTSNE/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DISTUTILS_USE_SETUPTOOLS=rdepend


RDEPEND="
	>=dev-python/numba-0.38.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14[${PYTHON_USEDEP}]
	>=sci-libs/scikit-learn-0.19[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/pynndescent"


