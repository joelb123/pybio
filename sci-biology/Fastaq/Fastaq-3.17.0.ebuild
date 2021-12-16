# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Manipulate FASTA/Q, GFF3, EMBL, GBK files with API for developers"
HOMEPAGE="https://github.com/sanger-pathogens/Fastaq"
SRC_URI="https://github.com/sanger-pathogens/Fastaq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests nose
