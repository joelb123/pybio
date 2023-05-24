# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 bash-completion-r1

DESCRIPTION="Run Typer scripts with completion, without having to create a package.."
HOMEPAGE="https://typer.tiangolo.com/typer-cli https://github.com/tiangolo/typer-cli"
SRC_URI="https://github.com/tiangolo/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="${BDEPEND}
	>=dev-python/typer-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.3.2[${PYTHON_USEDEP}]
"

#PATCHES=(
#	"${FILESDIR}"/${PN}-rename_script.patch
#)

distutils_enable_tests	pytest

#src_install() {
#	distutils-r1_python_install_for_testing
#	python -m  typer_cli --show-completion > bash-completion.sh
#	die
#	newbashcomp bash-completion.sh typer-cli
#}
