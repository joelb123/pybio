# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

MY_PN="PyCifRW"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Reading and writing CIF (Crystallographic Information Format) files"
HOMEPAGE="https://pypi.org/project/PyCifRW/ https://bitbucket.org/jamesrhester/pycifrw/wiki/Home"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"
