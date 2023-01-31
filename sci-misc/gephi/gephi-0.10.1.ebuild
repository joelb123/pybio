# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Gephi"
HOMEPAGE="https://gephi.org/"
SRC_URI="https://github.com/gephi/gephi/releases/download/v${PV}/gephi-${PV}-linux-x64.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=">=virtual/jdk-1.8"
RDEPEND="${DEPEND}"

function src_install {
        local INSTDIR="/opt/${PN}"
        dodir "${INSTDIR}"

        mv "${S}" "${D}/${INSTDIR}/${PV}" || die "Install failed!"
        cp "${FILESDIR}/gephi.png" "${D}/${TARGET_DIR}/${INSTDIR}/${PV}"

        # exec wrapper - it is important to set path to JDK, netbeans won't start otherwise
        make_wrapper "$P" "${INSTDIR}/${PV}/bin/gephi"
        sed -i 's/gephi[[:space:]]/gephi --jdkhome "$JAVA_HOME" /' "${D}/usr/bin/${P}"
        # desktop entry
        make_desktop_entry "$P" "Gephi $PV" "${INSTDIR}/${PV}/gephi.png" "Development"
}
