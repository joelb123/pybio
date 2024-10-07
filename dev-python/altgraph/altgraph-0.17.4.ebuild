# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A constructing graphs, BFS and DFS traversals, etc"
HOMEPAGE="https://altgraph.readthedocs.io/en/latest/"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="!test? ( test )"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

distutils_enable_tests unittest
