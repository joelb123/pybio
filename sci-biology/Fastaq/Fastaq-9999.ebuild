# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1 git-r3

DESCRIPTION="Manipulate FASTA/Q, GFF3, EMBL, GBK files with API for developers"
HOMEPAGE="https://github.com/sanger-pathogens/Fastaq"
EGIT_REPO_URI="https://github.com/sanger-pathogens/Fastaq.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
