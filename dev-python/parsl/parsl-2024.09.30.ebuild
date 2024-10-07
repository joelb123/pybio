# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Parallel script processing library"
HOMEPAGE="
	https://www.parsl-project.org/
	https://github.com/Parsl/parsl/
	https://pypi.org/project/parsl/
"
SRC_URI="
	https://github.com/Parsl/parsl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
RESTRICT="test"

RDEPEND="dev-python/dill[${PYTHON_USEDEP}]
	dev-python/globus-sdk[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.13[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.5.1[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-17.1.2[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/setproctitle[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.5.1[${PYTHON_USEDEP}]
	dev-python/tblib[${PYTHON_USEDEP}]
	>=dev-python/typeguard-2.10[${PYTHON_USEDEP}]
"
