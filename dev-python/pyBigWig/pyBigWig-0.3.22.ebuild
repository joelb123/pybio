# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
inherit distutils-r1

DESCRIPTION="quick access to and creation of bigWig files"
HOMEPAGE="https://github.com/dpryan79/pyBigWig"

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dpryan79/pyBigWig"
else
	SRC_URI="https://github.com/deeptools/pyBigWig/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="sci-biology/libBigWig"
RDEPEND="${DEPEND}"

src_prepare() {
        sed -e 's/, "setuptools_scm"//' -i pyproject.toml || die
        sed -e 's/[tool.setuptools_scm]//' -i pyproject.toml || die
		eapply_user
}
