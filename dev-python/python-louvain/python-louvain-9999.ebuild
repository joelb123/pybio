# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{6..10} )

inherit git-r3 distutils-r1

DESCRIPTION="Louvain Community Detection"
HOMEPAGE="https://github.com/taynaud/python-louvain"
EGIT_REPO_URI="https://github.com/taynaud/python-louvain.git"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="${RDEPEND}
	dev-python/networkx "

