# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Open source data visualization and analysis for novice and experts."
HOMEPAGE="https://orange.biolab.si/"
SRC_URI="https://github.com/biolab/orange3/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc postgres"

RDEPEND="
	dev-python/baycomp[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/bottleneck-1.0.0[${PYTHON_USEDEP}]
	dev-python/commonmark[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/openTSNE-0.3.12[${PYTHON_USEDEP}]
	>=dev-python/joblib-0.9.4[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	>=dev-python/pip-9.0.1[${PYTHON_USEDEP}]
	dev-python/pylint[${PYTHON_USEDEP}]
	dev-python/python-louvain[${PYTHON_USEDEP}]
	>=dev-python/pyqtgraph-0.10.0[${PYTHON_USEDEP}]
	dev-python/PyQt5[svg,testlib,${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/serverfiles[${PYTHON_USEDEP}]
	>=dev-python/setuptools-36.3[${PYTHON_USEDEP}]
	dev-python/xlsxwriter[${PYTHON_USEDEP}]
	>=sci-libs/scikit-learn-0.20.0[${PYTHON_USEDEP}]
	"

DEPEND="${RDEPEND}
	>=dev-python/numpy-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.16.1[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.0.0[${PYTHON_USEDEP}]
	doc? (
		dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
		dev-python/docutils[${PYTHON_USEDEP}]
		dev-python/numpydoc[${PYTHON_USEDEP}]
		dev-python/recommonmark[${PYTHON_USEDEP}]
		>=dev-python/sphinx-1.5[${PYTHON_USEDEP}] )
	postgres? (	dev-python/psycopg:2[${PYTHON_USEDEP}] )"

S="${WORKDIR}/orange3-${PV}"

QA_PREBUILT="/usr/lib*/python*/site-packages/Orange/tests/binary-blob.tab"

python_test() {
	esetup.py test
}
