# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Manipulate FASTA/Q, GFF3, EMBL, GBK files with API for developers"
HOMEPAGE="https://github.com/sanger-pathogens/Fastaq"
SRC_URI="https://github.com/sanger-pathogens/Fastaq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
# Nominally upstream still uses nose, though it does not encumber us, and tests pass:
# https://github.com/sanger-pathogens/Fastaq/issues/84
