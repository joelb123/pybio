# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

DISTUTILS_USE_SETUPTOOLS=rdepend
inherit eutils multiprocessing distutils-r1

DESCRIPTION="NumPy aware dynamic Python compiler using LLVM"
HOMEPAGE="https://numba.pydata.org/
	https://github.com/numba"
SRC_URI="https://github.com/numba/numba/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="openmp threads"

RDEPEND="${PYTHON_DEPS}
	>=dev-python/llvmlite-0.36.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	threads? ( dev-cpp/tbb )
"
DEPEND="${RDEPEND}"

DISTUTILS_IN_SOURCE_BUILD=1
distutils_enable_tests unittest

# doc system is another huge mess, skip it
PATCHES=(
	"${FILESDIR}/${P}-skip_tests.patch"
)

# Will fail with circular import under python 3.9.2 unless patch
# https://github.com/python/cpython/commits/c42d9777f7e3d307133adcaebc3a05a928999627 
# has been applied to python 3.9.2

pkg_setup() {
	if ! use openmp; then
		export NUMBA_DISABLE_OPENMP=1
	else
		unset NUMBA_DISABLE_OPENMP
	fi
	if ! use threads; then
		export NUMBA_DISABLE_TBB=1
	else
		unset NUMBA_DISABLE_TBB
		export TBBROOT="${EPREFIX}/usr"
	fi
}

# https://numba.pydata.org/numba-doc/latest/developer/contributing.html?highlight=test#running-tests
python_test() {
	distutils_install_for_testing
	${EPYTHON} setup.py build_ext --inplace || die \
		"${EPYTHON} failed to build_ext"
	${EPYTHON} runtests.py -m $(makeopts_jobs) || die \
		"${EPYTHON} failed unittests"
}

# https://numba.pydata.org/numba-doc/latest/user/installing.html
python_install_all() {
	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "compile cuda code" dev-util/nvidia-cuda-sdk
}
