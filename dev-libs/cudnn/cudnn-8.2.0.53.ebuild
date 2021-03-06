# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="NVIDIA Accelerated Deep Learning on GPU library"
HOMEPAGE="https://developer.nvidia.com/cuDNN"
SRC_URI="cudnn-11.3-linux-x64-v${PV}.tgz"

LICENSE="NVIDIA-cuDNN"
SLOT="0/8"
KEYWORDS="~amd64 ~amd64-linux"
IUSE="+cuda11-3"
RESTRICT="fetch"

DEPEND=">=dev-util/nvidia-cuda-toolkit-11.3.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}"
QA_PREBUILT="*"

src_install() {
	insinto /opt/cuda
	doins cuda/NVIDIA_SLA_cuDNN_Support.txt

	insinto /opt/cuda/targets/x86_64-linux
	doins -r cuda/include

	insinto /opt/cuda/targets/x86_64-linux/lib
	doins -r cuda/lib64/.
}
