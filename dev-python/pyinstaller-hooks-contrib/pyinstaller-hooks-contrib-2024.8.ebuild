# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

MY_PN="pyinstaller_hooks_contrib"
DESCRIPTION="Community maintained hooks for PyInstaller"
HOMEPAGE="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 GPL-2+"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

RESTRICT="test"
S="${WORKDIR}/${MY_PN}-${PV}"
# FIXME: flake8?

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

#distutils_enable_tests pytest
