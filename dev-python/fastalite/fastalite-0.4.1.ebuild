# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Simple FASTA/FASTQ parser."
HOMEPAGE="https://github.com/nhoffman/fastalite https://pypi.org/project/fastalite"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

BDEPEND=" "
RDEPEND="${BDEPEND}"

src_prepare() {
	rm -r tests || die
	default
}
