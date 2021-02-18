# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake bash-completion-r1

DESCRIPTION="Fast and sensitive sequence search and clustering"
HOMEPAGE="https://github.com/soedinglab/MMseqs2"
MY_PN="MMseqs2"

#The next line must be manually updated with each release
COMMIT="113e3212c137d026e297c7540e1fcd039f6812b1"

SRC_URI="https://github.com/soedinglab/${COMMIT:0:5}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	sys-libs/zlib[static-libs]
	app-arch/bzip2[static-libs]
	app-arch/zstd[static-libs]
"
DEPEND="${RDEPEND}
	app-shells/bash-completion
"
# patch to use system zstd from
#https://salsa.debian.org/med-team/mmseqs2/-/raw/master/debian/patches/use_system_zstd.patch
# This patch will not be needed in the next release when
# the USE_SYSTEM_ZSTD cmake flag will be defined.
PATCHES=( "${FILESDIR}"/${P}-use_system_zstd.patch )
S="${WORKDIR}/${MY_PN}-${COMMIT}"

src_configure() {
	#
	# Static build only due to use of an experimental
	# zstd feature only defined in static zstd lib:
	# https://github.com/soedinglab/MMseqs2/issues/411
	#
	local mycmakeargs=(
		# -DUSE_SYSTEM_ZSTD=ON
		-DBUILD_SHARED_LIBS=OFF
		-DVERSION_OVERRIDE=${PV}
	)
	cmake_src_configure
}

src_install(){
	dobin ${BUILD_DIR}/src/mmseqs
	newbashcomp util/bash-completion.sh mmseqs
	# Licenses missing for some dependencies,
	# Reported to upstream in issue 403, fixed in next release
	#
	# The next line will not be needed in the next release.
	cp LICENCE.md LICENSE.md
	#
	dodoc README.md LICENSE.md
	cp lib/omptl/License.txt LICENSE.omptl.txt
	dodoc LICENSE.omptl.txt
	cp lib/ips4o/README.md  README.ips4o.md
	cp lib/ips4o/LICENSE LICENSE.ips4o.txt
	dodoc README.ips4o.md LICENSE.ips4o.txt
	cp lib/microtar/README.md  README.microtar.md
	cp lib/microtar/LICENSE  LICENSE.microtar.txt
	dodoc README.microtar.md LICENSE.microtar.txt
	cp lib/simde/simde/README.md README.simde.md
	cp lib/simde/simde/COPYING COPYING.simde.txt
	dodoc README.simde.md COPYING.simde.txt
	cp lib/nedmalloc/Readme.txt README.nedmalloc.txt
	dodoc README.nedmalloc.txt
	cp lib/tinyexpr/README.md README.tinyexpr.md
	cp lib/tinyexpr/LICENSE LICENSE.tinyexpr.txt
	dodoc README.tinyexpr.md LICENSE.tinyexpr.txt
	# These lines will be needed in the next release
	# cp lib/alp/LICENSE LICENSE.alp.txt
	# dodoc LICENSE.alp.txt
	# cp lib/base64/LICENSE LICENSE.base64.txt
	# cp lib/base64/README.md README.base64.md
	# dodoc README.base64.md LICENSE.base64.txt
	# cp lib/cacode/LICENSE.LAST LICENSE.LAST.cacode.txt
	# cp lib/cacode/LICENSE.NCBI LICENSE.NCBI.cacode.txt
	# cp lib/cacode/README README.cacode.txt
	# dodoc LICENSE.LAST.cacode.txt LICENSE.NCBI.cacode.txt README.cacode.txt
	# cp lib/ksw2/LICENSE.txt LICENSE.ksw2.txt
	# cp lib/ksw2/README.md README.ksw2.txt
	# dodoc LICENSE.ksw2.txt  README.ksw2.txt
	# cp lib/microtar/README.md README.microtar.md
	# dodoc README.microtar.md
	# cp lib/xxhash/LICENSE LICENSE.xxhash.txt
	# dodoc LICENSE.xxhash.txt
	default
}
