EAPI=8
PYTHON_COMPAT=( python3_{8..11} )

inherit cmake

DESCRIPTION="kmer processing framework."
HOMEPAGE="https://kprocessor.readthedocs.io"
LICENSE="MIT"
SRC_URI="https://github.com/dib-lab/kProcessor/archive/v${PV}.tar.gz -> ${P}.tar.gz
         http://generisbio.com/distfiles/${P}-thirdparty.tgz"
DISTUTILS_USE_SETUPTOOLS=rdepend

BDEPEND="
	dev-cpp/nlohmann_json
	dev-libs/cereal
"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/kProcessor-${PV}"

src_configure() {
        local mycmakeargs=(
                -DUPDATE_DISCONNECTED=ON
				-Dno-dev
        )
        cmake_src_configure
}
