# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# original from https://github.com/gentoo/gentoo/blob/8789a3beb6931857f7a61b7c67e218208f36a64d/app-emulation/vendor-reset/vendor-reset-9999.ebuild

EAPI=8

inherit linux-mod linux-info toolchain-funcs

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/gnif/vendor-reset.git"
	EGIT_BRANCH="master"
	inherit git-r3
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/gnif/vendor-reset/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Linux kernel vendor specific hardware reset module"
HOMEPAGE="https://github.com/gnif/vendor-reset"
LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

MODULE_NAMES="vendor-reset(extra)"

pkg_setup() {
	local CONFIG_CHECK="FTRACE KPROBES PCI_QUIRKS KALLSYMS FUNCTION_TRACER"
	
	linux_config_exists

	linux-mod_pkg_setup

	BUILD_TARGETS="build"
	BUILD_PARAMS="KDIR=${KERNEL_DIR}"
}



src_install() {
	linux-mod_src_install

	insinto /etc/modules-load.d/
	newins "${FILESDIR}"/modload.conf vendor-reset.conf
}
