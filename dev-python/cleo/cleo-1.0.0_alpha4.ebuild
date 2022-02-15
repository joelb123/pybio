# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=pyproject.toml
PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

MY_PV=${PV/_alpha/a}

DESCRIPTION="Python tool for building testable command-line interfaces"
HOMEPAGE="https://github.com/sdispater/cleo"
SRC_URI="https://github.com/sdispater/cleo/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

BDEPEND="
	test? (
		dev-python/clikit[${PYTHON_USEDEP}]
		dev-python/crashtest[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)"
S="${WORKDIR}/${PN}-${MY_PV}"

distutils_enable_tests pytest
