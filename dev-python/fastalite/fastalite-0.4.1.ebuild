# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Simple FASTA/FASTQ parser."
HOMEPAGE="https://github.com/nhoffman/fastalite https://pypi.org/project/fastalite"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

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
