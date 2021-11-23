# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..10} )

inherit eutils flag-o-matic multilib python-single-r1 toolchain-funcs

MY_P="ncbi-blast-${PV}+-src"

DESCRIPTION="A subset of NCBI C++ Toolkit containing just the NCBI BLAST+"
HOMEPAGE="https://www.ncbi.nlm.nih.gov/books/bv.fcgi?rid=toolkit	https://ftp.ncbi.nih.gov/blast/executables/blast+"
SRC_URI="
	https://ftp.ncbi.nih.gov/blast/executables/blast+/${PV}/${MY_P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
IUSE="
	debug static-libs static threads pch
	test wxwidgets odbc
	berkdb boost bzip2 cppunit curl expat freetype gif
	glut gnutls hdf5 hiredis icu jpeg lzo mesa mysql muparser opengl pcre png python
	sablotron sqlite tiff xerces xalan xml xpm xslt X"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
#KEYWORDS=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	!sci-biology/ncbi-tools++
	!sci-biology/sra_sdk
	berkdb? ( sys-libs/db:4.3[cxx] )
	boost? ( dev-libs/boost )
	curl? ( net-misc/curl )
	sqlite? ( dev-db/sqlite:3 )
	mysql? ( virtual/mysql )
	opengl? ( virtual/opengl media-libs/glew:0= )
	mesa? ( media-libs/mesa[osmesa] )
	glut? ( media-libs/freeglut )
	hiredis? ( dev-libs/hiredis )
	freetype? ( media-libs/freetype )
	gnutls? ( net-libs/gnutls )
	python? ( ${PYTHON_DEPS} )
	cppunit? ( dev-util/cppunit )
	icu? ( dev-libs/icu )
	expat? ( dev-libs/expat )
	sablotron? ( app-text/sablotron )
	xml? ( dev-libs/libxml2 )
	xslt? ( dev-libs/libxslt )
	xerces? ( dev-libs/xerces-c )
	xalan? ( dev-libs/xalan-c )
	muparser? ( dev-cpp/muParser )
	hdf5? ( sci-libs/hdf5[cxx] )
	gif? ( media-libs/giflib )
	jpeg? ( virtual/jpeg:0= )
	png? ( media-libs/libpng:0= )
	tiff? ( media-libs/tiff:0= )
	xpm? ( x11-libs/libXpm )
	dev-libs/lzo
	app-arch/bzip2
	dev-libs/libpcre
	dev-db/lmdb"

RDEPEND="${DEPEND}"

#PATCHES=(
#	"${FILESDIR}"/${P}_longer_ids.patch
#)

S="${WORKDIR}/${MY_P}/c++"

src_prepare() {
	tc-export CXX CC
	default
}

src_configure() {
	local myconf=()
	myconf+=(
	--with-dll
	--with-lfs
	--with-openmp
	--with-64
	--with-build-root="${S}"_build
	--without-suffix
	--without-hostspec
	--without-version
	--with-bincopy
	--without-strip
	--without-ccache
	--without-distcc
	--without-ctools
	--with-z="${EPREFIX}/usr"
	--with-bz2="${EPREFIX}/usr"
	--without-sybase
	--with-autodep
	--with-ncbi-public
	$(use_with debug)
	$(use_with debug max-debug)
	$(use_with debug symbols)
	$(use_with static-libs static)
	$(use_with static static-exe)
	$(use_with threads mt)
	$(use_with prefix runpath "${EPREFIX}/usr/$(get_libdir)/${PN}")
	$(use_with test check)
	$(use_with pch)
	$(use_with lzo lzo "${EPREFIX}/usr")
	$(use_with pcre pcre "${EPREFIX}/usr")
	$(use_with gnutls gnutls "${EPREFIX}/usr")
	$(use_with hiredis hiredis "${EPREFIX}/usr")
	$(use_with mysql mysql "${EPREFIX}/usr")
	$(use_with muparser muparser "${EPREFIX}/usr")
	$(use_with opengl opengl "${EPREFIX}/usr")
	$(use_with mesa mesa "${EPREFIX}/usr")
	$(use_with opengl glut "${EPREFIX}/usr")
	$(use_with opengl glew "${EPREFIX}/usr")
	$(use_with wxwidgets wxwidgets "${EPREFIX}/usr")
	$(use_with wxwidgets wxwidgets-ucs)
	$(use_with freetype freetype "${EPREFIX}/usr")
	$(usex odbc --with-odbc="${EPREFIX}/usr" "")
	$(use_with python python "${EPREFIX}/usr")
	$(use_with boost boost "${EPREFIX}/usr")
	$(use_with sqlite sqlite3 "${EPREFIX}/usr")
	$(use_with icu icu "${EPREFIX}/usr")
	$(use_with expat expat "${EPREFIX}/usr")
	$(use_with xml libxml "${EPREFIX}/usr")
	$(use_with xml libxslt "${EPREFIX}/usr")
	$(use_with xerces xerces "${EPREFIX}/usr")
	$(use_with hdf5 hdf5 "${EPREFIX}/usr")
	$(use_with xalan xalan "${EPREFIX}/usr")
	--without-gif
	$(use_with jpeg jpeg "${EPREFIX}/usr")
	$(use_with tiff tiff "${EPREFIX}/usr")
	$(use_with png png "${EPREFIX}/usr")
	$(use_with xpm xpm "${EPREFIX}/usr")
	$(use_with curl curl "${EPREFIX}/usr")
	--without-gui
	--without-local-lbsm
	--without-ncbi-crypt
	#--without-connext
	--without-gbench
	--without-internal
	)

	use test ||	myconf+=( --with-projects="${FILESDIR}"/disable-testsuite-compilation.txt )


	einfo "bash ./src/build-system/configure --srcdir="${S}" --prefix="${EPREFIX}/usr" --libdir=/usr/lib64 ${myconf[@]}"

	bash \
		./src/build-system/configure \
		--srcdir="${S}" \
		--prefix="${EPREFIX}/usr" \
		--libdir=/usr/lib64 \
		--with-flat-makefile \
		${myconf[@]} || die "Maybe try new src/build-system/cmake/cmake-configure instead?"
}

src_compile() {
	emake -C "${S}"_build/build -f Makefile.flat
}

src_install() {
	rm -rvf "${S}"_build/lib/ncbi || die
	emake install prefix="${ED}/usr" libdir="${ED}/usr/$(get_libdir)/${PN}"
	#mv "${ED}"/usr/bin/rpsblast "${ED}"/usr/bin/rpsblast+
	#echo "LDPATH=${EPREFIX}/usr/$(get_libdir)/${PN}" > ${S}/99${PN}
	#doenvd "${S}/99${PN}"
}

pkg_postinst() {
	einfo 'Please run "source /etc/profile" before using this package in the current shell.'
	einfo 'Documentation is at https://www.ncbi.nlm.nih.gov/books/NBK7167/'
}
