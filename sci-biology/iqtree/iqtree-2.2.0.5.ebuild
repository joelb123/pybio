# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils cmake

DESCRIPTION="Efficient phylogenomic software by maximum likelihood"
HOMEPAGE="https://iqtree.org https://github.com/iqtree/iqtree2"
SRC_URI="https://github.com/iqtree/iqtree2/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
PATCHES=( "${FILESDIR}"/2.2.0.5-system-yaml-gsl.patch )

RDEPEND="
	dev-cpp/eigen
	dev-cpp/yaml-cpp
	dev-libs/boost
	sci-libs/gsl
	sys-libs/zlib
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}2-${PV}"

src_configure() {
	EXTRA_ECONF+="-DUSE_LSD2=OFF"
	local mycmakeargs=(
			${EXTRA_ECONF}
		)
	cmake_src_configure
}

src_install(){
	cmake_src_install
	cd $BUILD_DIR
	for soname in alignment/libalignment.so booster/libbooster.so lbfgsb/liblbfgsb.so libkernelavx.so libkernelfma.so libkernelsse.so main/libmain.so model/libmodel.so ncl/libncl.so nclextra/libnclextra.so pda/libpda.so phylo-yaml/libphyloYAML.so pll/libpll.so pll/libpllavx.so simulator/libsimulator.so sprng/libsprng.so terrace/libterrace.so terracetphast/libterracetphast.so terraphast/libterraphast.so tree/libtree.so utils/libutils.so vectorclass/libvectorclass.so whtest/libwhtest.so ; do
		dolib.so $soname || die
	done
	cd $S
	insinto /usr/share/"${PN}"
	for name in example.cf example.nex example.phy models.nex ; do
		doins example/${name}
		rm "$D"/usr/${name}
	done

}
